resource "aws_iam_role" "prometheus_scraper" {
  name = "PrometheusScraperRole"

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
            "oidc.eks.${var.region}.amazonaws.com/id/${var.oidc_id}:sub" : "system:serviceaccount:${var.namespace}:${var.service_account_name}"
          }
        }
      }
    ]
  })
  tags = merge(
    var.tags,
    {
      Name = "PrometheusScraperRole"
    }
  )
}

resource "aws_iam_role_policy" "prometheus_scraper_policy" {
  name = "PrometheusScraperRole-policy"
  role = aws_iam_role.prometheus_scraper.id


  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ec2:DescribeInstances",
          "ec2:DescribeTags",
          "ec2:DescribeRegions",
          "ec2:DescribeAvailabilityZones",
          "ec2:DescribeNetworkInterfaces",
          "sts:AssumeRole"
        ],
        Resource = "*"
      }
    ]
  })
}