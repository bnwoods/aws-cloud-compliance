control '5.1' do
    title "Ensure EBS Volumes are encrypted"
    aws_ebs_volumes.volume_ids.each do |volume_id|
        describe aws_ebs_volume(volume_id) do
          it { should be_encrypted }
        end
      end
  end