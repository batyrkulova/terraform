import boto3

ec2 = boto3.resource('ec2', region_name='us-west-2')


ami_id = 'ami-01102c5e8ab69fb75' 
instance_type = 't3.micro'
key_name = 'FrontendKey'
security_group_ids = ['sg-0c8937bc764477eb0']

try:
    instances = ec2.create_instances(
        ImageId=ami_id,
        MinCount=1,
        MaxCount=1,
        InstanceType=instance_type,
        KeyName=key_name,
        SecurityGroupIds=security_group_ids,
        TagSpecifications=[
            {
                'ResourceType': 'instance',
                'Tags': [
                    {
                        'Key': 'Name',
                        'Value': 'MyBoto3DemoInstance'
                    },
                ]
            },
        ]
    )

    instance_id = instances[0].id
    print(f"Successfully launched EC2 instance with ID: {instance_id}")

except Exception as e:
    print(f"Error launching EC2 instance: {e}")
