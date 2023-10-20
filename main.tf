provider "aws" {
  region = "eu-central-1"
}

resource "aws_s3_bucket" "praktyki-kurs-terrafrom-1" {
  bucket = "praktyki-kurs-terraform-lambda-1"
}

resource "aws_iam_role" "lambda-resizer-1" {
  name = "lambda-resizer-1"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"      
        },
        "Effect": "Allow",
        "Sid": ""
      }
  ]
}
EOF
}

resource "aws_iam_role_policy" "lambda-resizer-1" {
  role = aws_iam_role.lambda-resizer-1.name
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:Get*",
        "s3.Put*"
      ],
      "Effect": "Allow",
      "Resources": "praktyki-kurs-terraform-lambda-1"
    }
  ]
}
EOF  
}







