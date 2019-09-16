title 'Logging Guidelines'

control '2.1' do
    title "Ensure CloudTrail is enabled in all regions"
    describe aws_cloudtrail_trails do
      its('count') { should be > 0 }
    end
  
    describe.one do
      aws_cloudtrail_trails.trail_arns.each do |trail_arn|
        describe aws_cloudtrail_trail(trail_arn) do
          it { should be_multi_region_trail }
        end
      end
    end
  end
  
  control '2.2' do
    title "Ensure the S3 bucket CloudTrail logs to is not publicly accessible"
    aws_cloudtrail_trails.trail_arns.each do |trail_arn|
      bucket_name = aws_cloudtrail_trail(trail_arn).s3_bucket_name
      describe aws_s3_bucket(bucket_name) do
        it { should_not be_public }
      end
    end
  end

  control '2.3' do
    title "Ensure CloudTrail trails are integrated with CloudWatch Logs"
    aws_cloudtrail_trails.trail_arns.each do |trail_arn|
      describe aws_cloudtrail_trail(trail_arn) do
        its('delivered_logs_days_ago') { should eq 0 }
      end
    end
  end