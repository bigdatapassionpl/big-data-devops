
~~~
aws ec2 describe-instances

aws ec2 describe-instance-types
aws ec2 describe-instance-types --instance-types m5.xlarge

aws ec2 describe-images --filters --filters "Name=name,Values=Deep Learning AMI*"
aws ec2 describe-images --filters --filters "Name=name,Values=Deep Learning AMI*" | grep Name | grep "Deep Learning AMI"

-- Deep Learning Base AMI (Ubuntu 18.04) Version 46.0 - ami-0ecebc19d65492b8d
-- Deep Learning AMI (Ubuntu 18.04) Version 53.0 - ami-0f8c1b9de5e8d8095

aws ec2 run-instances \
    --image-id ami-0ecebc19d65492b8d \
    --count 1 \
    --instance-type m5.large


error_message=(encoded error message)
aws sts decode-authorization-message --encoded-message $error_message
aws sts decode-authorization-message --encoded-message $error_message --query DecodedMessage --output text | jq '.'

~~~

* https://awscli.amazonaws.com/v2/documentation/api/latest/reference/ec2/describe-instances.html
* https://awscli.amazonaws.com/v2/documentation/api/latest/reference/ec2/describe-instance-types.html
* 