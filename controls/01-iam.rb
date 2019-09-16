# copyright: 2018, The Authors

title 'IAM Guidelines'


# Fetch all keys; this is slow so cache it
all_access_keys = aws_iam_access_keys

# Fetch all users; this is slow so cache it
all_users = aws_iam_users


control '1.1' do
  title "Ensure multi-factor authentication (MFA) is enabled for all IAM users that have a console password"
  describe all_users
    .where(has_console_password?: true)
    .where(has_mfa_enabled?: false) do
    it { should_not exist }
  end
end

control '1.2' do
  title "Ensure credentials unused for 90 days or greater are disabled"
  # Never used access keys more than an hour old.
  describe all_access_keys
    .where { never_used }
    .where { active }
    .where { created_hours_ago > 1 } do 
    it { should_not exist }
  end

  # Active, used-at-least-once stale keys
  describe all_access_keys
            .where { ever_used }
            .where { last_used_days_ago > 90 }
            .where { active } do 
    it { should_not exist }
  end

  # No long-unused passwords
  describe all_users
           .where { password_ever_used? }
           .where { password_last_used_days_ago > 90 } do
   it { should_not exist }
  end
end

control '1.3' do
  title "Ensure access keys are rotated every 90 days or less"
  describe all_access_keys
    .where { created_days_ago > 90 }
    .where { active } do 
    it { should_not exist }
  end
end

control '1.4' do
  title "Ensure IAM password policy expires passwords within 90 days or less"
  describe aws_iam_password_policy do
    its('max_password_age_in_days') { should be >= 90 }
  end
end