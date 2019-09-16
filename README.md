# AWS Cloud Compliance profile

This profile is to be used in conjunction with Chef Compliance to check account level configuration compliance in AWS Accounts. 

### Controls
This profile contains the following controls:
- ##### 1 - IAM
  - 1.2 Ensure Credentials Unused for 90 Days or Greater are Disabled
  - 1.3 Ensure Access Keys are Rotated Every 90 Days or Less
  - 1.4 Ensure IAM Password Policy Expires Passwords Within 90 Days or Less

- ##### 2 - LOGS
  - 2.1 Ensure Cloudtrail is Enabled in All Regions
  - 2.2 Ensure the S3 Bucket Cloudtrail Logs to is Not Publicly Accessible
  - 2.3 Ensure CloudTrail Trails are Integrated With CloudWatch Logs

- ##### 3 - S3
  - 3.1 Ensure S3 Buckets are not Public

- ##### 4 - NETWORKING
  - 4.1 Ensure No Security Groups Allow Ingress from 0.0.0.0/0 to Port 22
  - 4.2 Ensure No Security Groups Allow Ingress from 0.0.0.0/0 to Port 3389
  - 4.3 Ensure Default VPC Does Not Exist

- ##### 5 - EBS
  - 5.1 Ensure EBS Volumes are Encrypted

- ##### 6 - REGION
  - 6.1 Ensure Unauthorized Regions are Disabled
