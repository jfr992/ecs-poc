data "archive_file" "lambda" {
  type        = "zip"
  source_file = "../../aws-lambda"
  output_path = "../../aws-lambda.zip"
}

resource "aws_s3_bucket" "app_bucket" {
  bucket        = "lambda-bucket"
  force_destroy = true
}

resource "aws_s3_bucket_object" "app_object " {
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