output "cw_event_rule_name" {
	value = "${aws_cloudwatch_event_rule.main.name}"
}
output "cw_event_rule_arn" {
	value = "${aws_cloudwatch_event_rule.main.arn}"
}
output "lambda_function_arn" {
	value = "${aws_lambda_function.main.arn}"
}
output "lambda_function_name" {
	value = "${aws_lambda_function.main.function_name}"
}
output "lambda_permission_source_arn" {
	value = "${aws_lambda_permission.main.source_arn}"
}
output "iam_role_id" {
	value = "${aws_iam_role.main.id}"
}
output "iam_role_name" {
	value = "${aws_iam_role.main.name}"
}
output "iam_role_policy_arn" {
	value = "${aws_iam_role.main.arn}"
}
