provider "aws" {
  region = "us-east-1" # Replace with your desired AWS region
}

resource "aws_cloudformation_stack" "cognito-backup-tf" {
  name          = "cognito-backup-tf"
  template_body = file("cognito-backup.template")

  parameters = {
    PrimaryUserPoolId = "us-east-1_qptswq08M"
    SecondaryRegion   = "us-east-2"
    ExportFrequency   = "EVERY_DAY"
    CognitoTPS        = "10"
    NotificationEmail = "khan.hadi2951@gmail.com"
    SnsPreference     = "INFO_AND_ERRORS"
  }

  capabilities = ["CAPABILITY_IAM"]
}
