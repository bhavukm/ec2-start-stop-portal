# A Bash Script-based User Interactive Portal to Start and Stop AWS EC2 Instances

**Problem Statement**: A manager who manages multiple developers working on various applications deployed on multiple AWS EC2 Instances has been advised by Senior Management to regularly stop a few instances when the developers are not using them. This is to support **AWS Cost Optimization** project currently happening in the company. The problem is that the manager has no knowledge on how to use AWS Management console or CLI to start/stop these instances. He has asked for a **User Interface** to do this.

**Solution**: The DevOps team came up with an idea of building a Bash Script-based **User Interactive Portal** to enable the developer manager to start/stop these instances. The script uses AWS CLI in the backend to call StartInstances and StopInstances API calls.

**Architectural Diagram:**

![image](https://github.com/user-attachments/assets/02bcaf0f-0a94-40d3-9575-aad5aaaca157)

Step-By-Step Instructions:

1. Provision 3 EC2 Instances: 1 will be Manager's Bastion Host and the other 2 will be developer's instances to be administered by the manager.
2. Create an IAM Policy to have Start/Stop access to the 2 instances, as given below:
   {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeInstances",
                "ec2:DescribeInstanceStatus",
                "ec2:DescribeTags"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ec2:StartInstances",
                "ec2:StopInstances"
            ],
            "Resource": [
                "arn:aws:ec2:us-east-1:AWS-Account-ID:instance/i-InstanceID1",
                "arn:aws:ec2:us-east-1:970547378834:instance/i-InstanceID2"
            ]
        }
    ]
}
