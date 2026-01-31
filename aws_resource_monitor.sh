
#!/bin/bash

##########################
# This script monitors ec2 resources
# Author: Masood
# Version: v1

# This script helps to:
# - Lists running ec2 instances
# - Checks unused/stopped resources
# - Lists unused EBS volumes
# - Lists unassociated elastic IP's
##########################

if [ $# -ne 1 ]; then
    echo "Usage: $0 <aws_region>"
    exit 1
fi

REGION=$1

if ! command -v aws &> /dev/null; then
    echo "AWS CLI not installed"
    exit 1
fi

echo "AWS Resource Report for region: $REGION"
echo "-------------------------------------------" 

echo "Running ec2 instances"
aws ec2 describe-instances\
  --region $REGION\
  --filters "Name=instance-state-name,Values=running" \
  --query "Reservations[].Instances[].InstanceId" \
  --output table
echo "-------------------------------------------"

echo "Unused/stopped ec2 instances"
aws ec2 describe-instances\
  --region $REGION \
  --filters "Name=instance-state-name,Values=stopped" \
  --query "Reservations[].Instances[].InstanceId" \
  --output table
echo "-------------------------------------------"

echo "Unused EBS volumes"
aws ec2 describe-volumes \
  --region $REGION \
  --filters "Name=status,Values=available" \
  --query "Volumes[].VolumeId" \
  --output table
echo "-------------------------------------------"

echo "Unassociated Elastic IPs:"
aws ec2 describe-addresses \
  --region $REGION \
  --query "Addresses[?AssociationId==null].PublicIp" \
  --output table


echo
echo "Resource check completed."
