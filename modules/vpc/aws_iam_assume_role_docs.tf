# data "aws_iam_policy_document" "codepipeline_assume_role_policy" {
#   statement {
#     actions = ["sts:AssumeRole"]

#     principals {
#       type        = "Service"
#       identifiers = ["codepipeline.amazonaws.com"]
#     }
#   }
# }

# data "aws_iam_policy_document" "codebuild_assume_role" {
#   statement {
#     effect  = "Allow"
#     actions = ["sts:AssumeRole"]
#     principals {
#       type        = "Service"
#       identifiers = ["codebuild.amazonaws.com"]
#     }
#   }
# }
