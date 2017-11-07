resource "aws_cloudwatch_event_rule" "main" {
	name = "snapbkp_event"
  schedule_expression = "cron(0 1 ? * * *)"
}

resource "aws_cloudwatch_event_target" "main" {
	rule = "${var.cloudwatch_event_target_rule}"
	target_id = "${var.cloudwatch_event_target_name}"
	arn = "${var.lambda_function_arn}"
}

resource "aws_lambda_permission" "main" {
	statement_id = "AllowExecutionFromCloudWatch"
	action = "lambda:InvokeFunction"
	function_name = "${var.lambda_permission_function_name}"
	principal = "events.amazonaws.com"
	source_arn = "${var.lambda_permission_source_arn}"
}

resource "aws_iam_role" "main" {
  name = "snapbkp"

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

resource "aws_iam_role_policy" "main" {
	name = "snapbkp_policy"
  role = "${var.iam_role_id}"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:*"
            ],
            "Resource": "arn:aws:logs:*:*:*"
        },
        {
            "Effect": "Allow",
            "Action": "ec2:Describe*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ec2:CreateSnapshot",
                "ec2:DeleteSnapshot",
                "ec2:CreateTags",
                "ec2:ModifySnapshotAttribute",
                "ec2:ResetSnapshotAttribute"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
EOF
}

resource "aws_lambda_function" "main" {
	function_name = "snapbkp"
  #filename = "${var.lambda_function_filename}"
	s3_bucket = "cmstools"
	s3_key = "snapbkp.zip"
	#role = "arn:aws:iam::289208248335:role/service-role/bkp"
	role = "${var.lambda_function_role}"
	handler = "${var.lambda_function_handler}"
	runtime = "python2.7"
	timeout = 30
}

#resource "aws_lambda_function" "main" {
#	function_name = "snapbkp"
#  filename = "${var.lambda_function_filename}"
#	#role = "arn:aws:iam::289208248335:role/service-role/bkp"
#	role = "${var.lambda_function_role}"
#	handler = "${var.lambda_function_handler}"
#	runtime = "python2.7"
#	timeout = 30
#}
