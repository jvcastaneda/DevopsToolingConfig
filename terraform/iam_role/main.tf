provider "aws" {
    region = "us-west-2"
}

resource "aws_iam_role" "yace" {
    name = "YACEServiceRole"

    assume_role_policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
            {
                Effect = "Allow",
                Principal = {
                    Federated = "arn:aws:iam::${var.account_id}:oidc-provider/oidc.eks.${var.region}.amazonaws.com/id/${var.oidc_id}"
                },
                Action = "sts:AssumeRoleWithWebIdentity",
                Condition = {
                    StringEquals = {
                        "oidc.eks.${var.region}.amazonaws.com/id/${var.oidc_id}:sub": "system:serviceaccount:${var.namespace}:${var.service_account_name}"
                    }
                }
            }
        ]
    })
}

resource "aws_iam_role_policy" "yace" {
    name   = "YACEServiceRole-policy"
    role   = aws_iam_role.yace.id

    policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
            {
                Effect   = "Allow",
                Action   = [
                    "tag:GetResources",
                    "cloudwatch:GetMetricData",
                    "cloudwatch:GetMetricStatistics",
                    "cloudwatch:ListMetrics",
                    "apigateway:GET",
                    "aps:ListWorkspaces",
                    "autoscaling:DescribeAutoScalingGroups",
                    "dms:DescribeReplicationInstances",
                    "dms:DescribeReplicationTasks",
                    "ec2:DescribeTransitGatewayAttachments",
                    "ec2:DescribeSpotFleetRequests",
                    "shield:ListProtections",
                    "storagegateway:ListGateways",
                    "storagegateway:ListTagsForResource",
                    "iam:ListAccountAliases"
                ],
                Resource = "*"
            }
        ]
    })
}