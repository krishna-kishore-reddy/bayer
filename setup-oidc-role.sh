#!/bin/bash

# Create IAM role for GitHub Actions OIDC
aws iam create-role \
    --role-name github-actions-role \
    --assume-role-policy-document '{
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": {
                    "Federated": "arn:aws:iam::038462776086:oidc-provider/github-actions-token-actions.githubusercontent.com"
                },
                "Action": "sts:AssumeRoleWithWebIdentity",
                "Condition": {
                    "StringEquals": {
                        "github-actions-token-actions.githubusercontent.com:sub": "repo:krishna-kishore-reddy/bayer:ref:refs/heads/main"
                    }
                }
            }
        ]
    }'

# Attach policies needed for Terraform
aws iam attach-role-policy \
    --role-name github-actions-role \
    --policy-arn arn:aws:iam::aws:policy/AWSLambda_FullAccess

aws iam attach-role-policy \
    --role-name github-actions-role \
    --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess

aws iam attach-role-policy \
    --role-name github-actions-role \
    --policy-arn arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess

aws iam attach-role-policy \
    --role-name github-actions-role \
    --policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess

aws iam attach-role-policy \
    --role-name github-actions-role \
    --policy-arn arn:aws:iam::aws:policy/AmazonEKS_FullAccess

aws iam attach-role-policy \
    --role-name github-actions-role \
    --policy-arn arn:aws:iam::aws:policy/AmazonVPCFullAccess

aws iam attach-role-policy \
    --role-name github-actions-role \
    --policy-arn arn:aws:iam::aws:policy/IAMFullAccess

echo "Role created! Add this to GitHub secrets:"
echo "GITHUB_OIDC_ROLE = github-actions-role"
