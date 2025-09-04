import boto3

# Use EC2 resource
ec2 = boto3.resource('ec2', region_name='us-west-2')

# Replace with your actual instance ID
instance_id = 'i-070596526426c8264'

# Get instance object
instance = ec2.Instance(instance_id)

try:
    response = instance.terminate()
    print(f"Termination initiated for {instance_id}:")
    print(f"Current state: {response['TerminatingInstances'][0]['CurrentState']['Name']}")
except Exception as e:
    print(f"Error terminating instance: {e}")
