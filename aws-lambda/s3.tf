

resource "aws_s3_bucket" "app_bucket" {
  bucket        = "reorg-lambda-bucket-assignment"
  force_destroy = true
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