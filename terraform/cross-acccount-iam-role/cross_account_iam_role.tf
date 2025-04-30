resource "aws_iam_role" "prometheus_scraper" {
  name = "PrometheusScraperRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          AWS = "arn:aws:iam::${var.account_id}:role/${var.role_name}"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "prometheus_scraper_policy" {
  name = "PrometheusScraperRole-policy"
  role = aws_iam_role.prometheus_scraper.id


  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Resource = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
        ],
        Resource = "*"
      }
    ]
  })
}