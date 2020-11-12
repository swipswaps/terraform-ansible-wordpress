# terraform-ansible-wordpress
At first you need to create AWS security credentials for terraform
-
- Open the AWS Console
- Click on your username near the top right and select My Security Credentials
- Click on Users in the sidebar
- Click on your username
- Click on the Security Credentials tab
- Click Create Access Key
- Click Show User Security Credentials
- Copy access key and secret key 

Copy .env.template to .env
-
- Then fill in the values inside the file

Install terraform
-

Install Ansible
-

Then run the following commands:
-
- ansible-galaxy collection install community.general
- terraform init
- terraform apply -auto-approve

You will see the output with SSH access an Wordpress URL and Wordpress admin password.
