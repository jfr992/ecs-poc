# reorg-assignment

# CI/CD Pipeline for FastAPI and AWS Lambda Applications

## Overview
This project sets up a CI/CD pipeline for deploying two Python applications: a FastAPI application and an AWS Lambda function. The FastAPI application is publicly accessible via an ECS service, while the AWS Lambda function is scheduled to run every hour. Both applications are deployed within the same VPC in a new AWS account using Docker, Terraform, Terragrunt, and GitHub Actions.

## Workflows
The CI/CD pipeline consists of the following five workflows:

1. **build-deploy-api**: This workflow is triggered whenever there is a change in the main branch and the `./api` directory. It builds and deploys the FastAPI application. If there are changes in the Dockerfile or the application code, it will trigger a build and deployment after merging to the main branch.

2. **terragrunt-plan**: This workflow runs during pull requests and plans the infrastructure changes whenever there are modifications in the `infrastructure` directory. It includes planning the infrastructure for the FastAPI application (ECS) and networking components. Detailed information can be found in the README file within the `infrastructure` folder.

3. **terragrunt-plan-lambda**: Similar to `terragrunt-plan`, this workflow runs during pull requests and plans the infrastructure changes whenever there are modifications in the `aws-lambda` directory. This step involves planning the components required for the Lambda function (such as S3). More details can be found in the README file within the `aws-lambda` folder.

4. **terragrunt-apply**: This workflow is triggered by a push to the main branch and applies the infrastructure changes planned in the `infrastructure` directory. 

5. **terragrunt-apply-lambda**: This workflow is triggered by a push to the main branch and applies the infrastructure changes planned in the `aws-lambda` directory.

Terragrunt is utilized to keep the Infrastructure as Code (IaC) more DRY (Don't Repeat Yourself), enhancing maintainability and readability.

## AWS Architecture

The following diagram shows the solution architecture

![Description](reorg.drawio.png.png)


## CI/CD

