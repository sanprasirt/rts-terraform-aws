# rts-terraform-aws

## How to verify aws-auth ConfigMap after Cluster creation

```bash
aws sts get-caller-identity
aws eks --region ap-southeast-1 update-kubeconfig --name rts-dev-demo1


# Verify Kubernetes Worker Nodes using kubectl
kubectl get nodes
kubectl get nodes -o wide
kubectl -n kube-system describe configmap aws-auth

# Verify aws-auth configmap
kubectl -n kube-system get configmap aws-auth -o yaml
```

## Configure kubectl for Amazon EKS user profile and set default profile

```bash
# To list all configuration data
aws configure list

# To list all your profile names
aws configure list-profiles

# Configure aws cli eksadmin1 Profile
aws configure --profile eksadmin
AWS Access Key ID: xxxxx
AWS Secret Access Key: xxxxx
Default region: ap-southeast-1
Default output format: json

# Get current user configured in AWS CLI
aws sts get-caller-identity
```

## Assume IAM Role for Amazon EKS Cluster

```bash
# Export AWS Account ID
ACCOUNT_ID=$(aws sts get-caller-identity --query "Account" --output text)
echo $ACCOUNT_ID

# Assume IAM Role
aws sts assume-role --role-arn "arn:aws:iam::<REPLACE-YOUR-ACCOUNT-ID>:role/eks-admin-role" --role-session-name eksadminsession201

# GET Values and replace here
export AWS_ACCESS_KEY_ID=RoleAccessKeyID
export AWS_SECRET_ACCESS_KEY=RoleSecretAccessKey
export AWS_SESSION_TOKEN=RoleSessionToken

# Verify current user configured in aws cli
aws sts get-caller-identity

## Sample Output
aws sts get-caller-identity
{
    "UserId": "AROASUF7HC7SULHUW3YCH:eksadminsession201",
    "Account": "809346580879",
    "Arn": "arn:aws:sts::809346580879:assumed-role/hr-dev-eks-admin-role/eksadminsession201"
}

# Clean-Up kubeconfig
>$HOME/.kube/config
cat $HOME/.kube/config

# Configure kubeconfig for kubectl
aws eks --region <region-code> update-kubeconfig --name <cluster_name>
aws eks --region ap-southeast-1 update-kubeconfig --name rts-dev-demo1
```
