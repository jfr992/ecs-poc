data "archive_file" "lambda" {
  type        = "zip"
  source_file = "../../aws-lambda/handler.py"
  output_path = "../../aws-lambda.zip"
}

resource "aws_s3_bucket" "app_bucket" {
  bucket        = "reorg-lambda-bucket-assignment"
  force_destroy = true
}

resource "aws_s3_bucket_object" "app_object" {
  bucket = aws_s3_bucket.app_bucket.id
  key    = "aws-lambda.zip"
  source = data.archive_file.lambda.output_path
  etag   = filemd5(data.archive_file.lambda.output_path)

  lifecycle {
    ignore_changes = [
      etag,
      version_id
    ]
  }
}


resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.app_bucket.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicRead",
      "Effect": "Allow",
      "Principal": {
        "AWS": "${aws_iam_role.app_lambda_role.arn}"
      },
      "Action": "s3:PutObject",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.app_bucket.bucket}/*"
    }
  ]
}
EOF
}
