
# Terraform AWS EC2 with ALB & Auto Scaling

## Overview

This Terraform configuration sets up an AWS EC2 instance with Auto Scaling. Auto Scaling helps you maintain application availability and allows you to automatically adjust the number of EC2 instances in your Auto Scaling group.

## Prerequisites

1. **Terraform Installed:** Make sure you have Terraform installed on your local machine. You can download it from [Terraform Downloads](https://www.terraform.io/downloads.html).

2. **AWS Credentials:** Ensure that you have AWS credentials configured on your machine. You can set up credentials using the AWS CLI or by configuring environment variables.

```bash
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
export AWS_DEFAULT_REGION="your-region"
```

3. **Key Pair:** Create an AWS key pair that will be used to access the EC2 instances. Save the private key locally.

4. **AMI ID:** Use any latest Ubuntu AMI ID if you get ami not found error when running this solution. 

## Usage

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/Gopinath-Radhakrishnan/qstest.git
   ```

2. **Initialize Terraform:**

   ```bash
   terraform init
   ```

3. **Edit Variables (Optional):**

   Open the `variables.tf` file and update the variables as needed. You can specify the instance type, key pair name, and other configuration options.

4. **Review and Apply:**

   ```bash
   terraform apply
   ```

   Review the plan, and if everything looks good, type `yes` to apply the changes.

5. **Accessing Instances:**

   Once the deployment is complete, the DNS name of the load balancer will be displayed. Go to the URL and you should be able to access the application
   
## Cleanup

To destroy the infrastructure and terminate all resources, run:

```bash
terraform destroy
```

Review the plan and type `yes` to confirm the destruction.

## Customization

Feel free to customize the configuration files according to your specific requirements. You can modify variables, add security groups, or adjust auto scaling policies.

## Disclaimer

This Terraform configuration is provided as-is and may need adjustments based on your specific use case and requirements.
