title 'S3 Bucket Guidelines'

control '3.1' do
    title "Ensure S3 Buckets Are Not Public"
    desc "All S3 Buckets should not be public and should be encrypted"
    aws_s3_buckets.bucket_names.each do |buckets|
      describe aws_s3_bucket(bucket_name: buckets) do
        it { should_not be_public }
        it { should have_access_logging_enabled }
        it { should have_default_encryption_enabled }
      end
    end
  end