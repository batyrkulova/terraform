import boto3
ec2_client = boto3.client('ec2', region_name='us-west-2')
response = ec2_client.describe_instances(
Filters=[
        {
            'Name': 'instance-state-name',
            'Values': ['running', 'stopped'] 
        },
        
    ]
)

for reservation in response['Reservations']:
        for instance in reservation['Instances']:
            instance_id = instance['InstanceId']
            instance_type = instance['InstanceType']
            state = instance['State']['Name']
            print(f"Instance ID: {instance_id}, Type: {instance_type}, State: {state}")