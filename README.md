# Useful bash commands for AWS:

## 1 - List Amazon Linux AMIs Available for each region:

**Pre requisites:** 
- Install jq first: https://stedolan.github.io/jq/
- Install and configure AWS CLI (with json output): http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-set-up.html

```
$ for r in $(aws ec2 describe-regions | jq -r '.Regions[].RegionName'); do echo -n "$r "; aws --region $r ec2 describe-images --filter 'Name=description,Values=Amazon Linux AMI 2016.03.3 x86_64 HVM GP2' | jq -r '.Images[].ImageId'; done
```

> If you want another version or type just change it in the "Values" attribute.
