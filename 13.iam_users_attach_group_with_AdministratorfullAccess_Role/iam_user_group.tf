## all users are attach to the group and roles or policys attach to the group.
## this mainy group level applying all  permission.

##creating an IAM administrator group
resource "aws_iam_group" "admin_group" {
  name = var.group_name
} 

## creating user 1
resource "aws_iam_user" "user_one" {
  name = "gani"
}

## creating user 2
resource "aws_iam_user" "user_two" {
  name = "nikhil"
}

##Adding the multoiple users to the group
resource "aws_iam_group_membership" "team" {
  name = "admin-group-membership"
  users = [aws_iam_user.user_one.name, aws_iam_user.user_two.name]
  group = aws_iam_group.admin_group.name
}

/* ## Attaching the administartor deafult role policy to the administartor group .
resource "aws_iam_group_policy_attachment" "administratorfull_access__policy" {
  group      = aws_iam_group.admin_group.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
} */

/* ##attaching the  multiple default role policy to the administartor group
 resource "aws_iam_group_policy_attachment" "administratorfull_access__policy" {
  group      = aws_iam_group.admin_group.name
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess", 
    "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  ])
  policy_arn = each.value
} */

##create your own custom policys  and attach to the group
resource "aws_iam_group_policy" "administratorfull_access_custom_policy" {
  name = "custom_administrators_policy"
  group      = aws_iam_group.admin_group.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "*",
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

/* ##create your own custom policys  and attach to the group 
resource "aws_iam_group_policy" "custom_mutliple_policys" {
  name = "custom_mutliple_policys"
  group      = aws_iam_group.admin_group.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "ec2:*",
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = "s3:*",
        Effect   = "Allow"
        Resource = "*"
      },

    ]
  })
} */
