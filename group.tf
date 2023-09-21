# Create an IAM group named "cloud" with an admin access policy
resource "aws_iam_group" "cloud_group" {
  name = "cloud"
}

resource "aws_iam_policy" "admin_policy" {
  name        = "admin-policy"
  description = "Administrator Access Policy"

  # Define the permissions for the admin policy (example: full access to all services)
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = "*",
        Effect   = "Allow",
        Resource = "*",
      },
    ],
  })
}

resource "aws_iam_policy_attachment" "admin_policy_attachment" {
  name       = "admin-policy-attachment"
  policy_arn = aws_iam_policy.admin_policy.arn
  groups     = [aws_iam_group.cloud_group.name]
}
# Add the user "john2030" to the group "cloud"
resource "aws_iam_group_membership" "john2030_membership" {
  name  = aws_iam_user.john2030_user.name
  users = [aws_iam_user.john2030_user.name]
  group = aws_iam_group.cloud_group.name
}






