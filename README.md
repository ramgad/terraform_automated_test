# Terraform AWS S3 SNS KMS Subscription

This repository contains step by step guide to provision AWS S3 bucket, AWS SNS Queue and have Integration between both of them. The infrastructure is created using terraform code and expected to have some working knowledge on the terraform

## PreRequisites: 

1. [Installation of AWSCLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
2. [Install GIT](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) (required to download this repo)
3. [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) (Install and basic knowledge on troubleshooting)
4. Install Ruby and its dependencies

```
brew install ruby
brew install rbenv

# Also add this to your ~/.bash_profile
export PATH="$HOME/.rbenv/shims:$PATH"

rbenv install 2.6.0
rbenv global 2.6.0
```

Once specific version is installed, then install bundler.
bundler provides a consistent environment for ruby projects by tracking and installing the exact gems that are needed.
```
sudo gem install bundler
```

Install all the ruby gems required for this project.
```
bundle install
```

It will create a Gemfile.lock
At this point, you have installed all the dependencies required to test your terraform module, now, you are ready to kitchen commmands to apply and test your changes.


## GIT Repo
- Download the latest source from this repo

If you already have the repo downloaded and unsure about having latest, git pull command bill bring the latest code
``` 
    commands:
    git clone https://github.com/.....
```

## Setup AWS Profile
The AWS CLI stores sensitive credential information that you specify with aws configure in a local file named credentials, in a folder named .aws in your home directory.

For example, the files generated by the AWS CLI for a default profile configured with aws configure looks similar to the following.

~/.aws/credentials

[default]
aws_access_key_id=AKIAIOSFODNN7EXAMPLE
aws_secret_access_key=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY

[mypersonalAWSaccount-dev]
aws_access_key_id=ALIATHISODNN7EXAMPLE
aws_secret_access_key=wJalrXUtnFEMI/K7EXXY/bPxRfiCYEXAMPLEKEY

Export AWS profile by pointing to the desired account.

export AWS_PROFILE=<mypersonalAWSaccount-dev> -- Please ensure that this entry exists in the ~/.aws/credentials file

Test connectivity: 
aws s3 ls

In case you want setup new AWS profile, more information can be found [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html).

You will need access_key and secret_key of your AWS account

This profile is going to be used for creating the S3 Bucket and SNS Queue

### Permissions
The assumption is that your profile with the above key has access to create the SNS, S3 bucket. 


### Execution

Please follow the steps below to run the code
```
1. terraform init
2. terraform validate
3. terraform plan -out "plan.out"
4. terraform apply "plan.out"

### Manual Steps:
You will receive subscription confirmation email (assuming the terraform.tfvars has your email address). Upon confirming the subscription, you can go ahead and upload a new file in the s3 bucket. You should see a notification sent out to the email


## Kitchen Test steps
```
1. Initializes the Test: bundle exec kitchen create
2. Creates the resources for testing: bundle exec kitchen converge
3. Actual Test runs with this command: bundle exec kitchen verify
4. Cleanup: bundle exec kitchen destroy
```

## Clean up

Issue the following commands from where the terraform apply was run. The same location hosts the terraform state and will help in cleaning all the resources it has created

1. terraform destroy -auto-approve


