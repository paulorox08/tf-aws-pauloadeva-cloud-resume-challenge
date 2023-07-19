provider "aws" {
    region = "ap-southeast-2"

    assume_role {
        role_arn = "arn:aws:iam::930896767269:role/GitHubAction-AssumeRoleWithAction"
        session_name = "tf-aws-pauloadeva-cloud-resume-challenge"
        external_id = "paulorox14@github"
    }

    # default_tags {
    #     tags = <add_here>
    # }

    terraform {
        require_version = ">= 1.0.0,< 2.0.0"

        required_providers {
            aws = {
                source = "hashicorop/aws"
                version = "-> 4.0"
            }
        }

        backend "s3" {
            bucket = "tf-aws-pauloadeva-cloud-resume-challenge-state-bucket"
            key = "terraform.tfstate"
            region = "ap-southeast-2"
            encrypt = true
            # dynamodb_table = "terraform-locks"
            # role_arn = "arn:aws:iam::930896767269:role/GitHubAction-AssumeRoleWithAction"
        }
    }
}