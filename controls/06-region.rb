
control '6.1' do
  title "Ensure Unauthorized Regions are Disabled"
  # This should be modified to match your current expectations of regions enabled.
    describe aws_regions do
      its('region_names') { should_not include 'eu-west-1' }
      its('region_names') { should_not include 'eu-west-2' }
      its('region_names') { should_not include 'eu-west-3' }
      its('region_names') { should_not include 'eu-north-1' }
      its('region_names') { should_not include 'ap-east-1' }
      its('region_names') { should_not include 'ap-south-1' }
      its('region_names') { should_not include 'ap-northeast-2' }
      its('region_names') { should_not include 'ap-southeast-1' }
      its('region_names') { should_not include 'ap-southeast-2' }
      its('region_names') { should_not include 'ap-northeast-1' }
      its('region_names') { should_not include 'ca-central-1' }
      its('region_names') { should_not include 'eu-central-1' }
      its('region_names') { should_not include 'me-south-1' }
      its('region_names') { should_not include 'sa-east-1' }
    end
  end
end