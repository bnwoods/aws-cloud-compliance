title 'Networking Guidelines'

control '4.1' do
  title "Ensure no security groups allow ingress from 0.0.0.0/0 to port 22"
  aws_security_groups.group_ids.each do |sg_id|
    describe aws_security_group(group_id: sg_id) do
      it { should_not allow_in(ipv4_range: '0.0.0.0/0', port: 22) }
    end
  end
end

control '4.2' do
  title "Ensure no security groups allow ingress from 0.0.0.0/0 to port 3389"
  aws_security_groups.group_ids.each do |sg_id|
    describe aws_security_group(group_id: sg_id) do
      it { should_not allow_in(ipv4_range: '0.0.0.0/0', port: 3389) }
    end
  end
end

  control '4.3' do
    title "Ensure Default VPC Does Not Exist"
    describe aws_vpc do
        it { should_not exist }
    end
  end