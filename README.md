**YouTube Video:** https://youtu.be/bp-V9_AlrMo

# A Bash Script-based User Interactive Portal to Start and Stop AWS EC2 Instances

**Problem Statement**: A manager who manages multiple developers working on various applications deployed on multiple AWS EC2 Instances has been advised by Senior Management to regularly stop a few instances when the developers are not using them. This is to support **AWS Cost Optimization** project currently happening in the company. The problem is that the manager has no knowledge on how to use AWS Management console or CLI to start/stop these instances. He has asked for a **User Interface** to do this. Also, the Security Team wants to refrain from giving the AWS Management Console access to him.

**Solution**: The DevOps team came up with an idea of building a Bash Script-based **User Interactive Portal** to enable the developer manager to start/stop these instances. The script uses AWS CLI in the backend to call StartInstances and StopInstances API calls.

**Architectural Diagram:**

![image](https://github.com/user-attachments/assets/02bcaf0f-0a94-40d3-9575-aad5aaaca157)

**Step-By-Step Instructions:**

1. Provision 3 EC2 Instances (Amazon Linux 2023 AMI): 1 will be Manager's Bastion Host and the other 2 will be developer's instances to be administered by the manager.
2. Create an IAM Policy (attached in the git repo) to have Start/Stop access to the 2 instances. Replace the placeholder for the 2 Instance IDs and your AWS Account ID.
3. Create an IAM Role and attach the IAM Policy created in Step 2 to it. Attach the IAM Role to the Bastion Host.
4. SSH to the Bastion Host as root and install "git" and "dialog" packages: "yum install git -y && yum install dialog -y"
5. Clone the repo to copy the bash scripts (git clone <repo-url>). Replace the placeholders in the script with your values.
6. Create a user named portaluser and set the password: "useradd portaluser" ; "passwd portaluser". Modify the /etc/ssh/sshd_config file to enable "PasswordAuthentication".
7. Restart the sshd service: "systemctl restart sshd".
8. Copy all the scripts to /home/portaluser directory (cp /root/ec2-start-stop-portal/s* /home/portaluser/).
9. Change the permissions to allow portaluser to run the scripts.
    chown -R portaluser: /home/portaluser/*
    chmod 777 /home/portaluser/*
11. Add start-stop-ec2-script.sh in .bash_profile of portaluser.
    vim /home/portaluser/.bash_profile
    
    ![image](https://github.com/user-attachments/assets/77b1c8cf-e61d-47a0-882b-fac6406fa822)
    

13. Login with portaluser user and test the scripts.

    <img width="672" alt="ec2-start-stop-portal" src="https://github.com/user-attachments/assets/4c7c4553-855c-4c79-80c1-36017cb52fe2" />

