# data "aws_iam_policy_document" "codepipeline_policy_doc" {
#   statement {
#     effect = "Allow"
#     resources = [
#       "${data.aws_s3_bucket.codepipeline_bucket.arn}/*"
#     ]
#     actions = [
#       "s3:GetObject",
#       "s3:GetObjectVersion",
#       "s3:PutObject",
#     ]
#   }

#   statement {
#     effect = "Allow"
#     resources = [
#       data.aws_s3_bucket.codepipeline_bucket.arn,
#     ]
#     actions = [
#       "s3:GetBucketVersioning",
#       "s3:ListBucketVersions",
#     ]
#   }

#   statement {
#     effect    = "Allow"
#     resources = [for k, v in local.build_projects : aws_codebuild_project.codebuild_project[k].arn]
#     actions = [
#       "codebuild:BatchGetBuilds",
#       "codebuild:StartBuild"
#     ]
#   }

#   dynamic "statement" {
#     for_each = local.build_projects

#     content {
#       effect    = module.codebuild_key[statement.key].permission_block.effect
#       resources = module.codebuild_key[statement.key].permission_block.resources
#       actions   = module.codebuild_key[statement.key].permission_block.actions
#     }
#   }

#   statement {
#     effect    = "Allow"
#     resources = [var.codestar_connection_arn]
#     actions = [
#       "codestar-connections:UseConnection"
#     ]
#   }

#   dynamic "statement" {
#     for_each = var.codepipeline_additional_permissions
#     content {
#       effect    = statement.value["effect"]
#       resources = statement.value["resources"]
#       actions   = statement.value["actions"]
#     }
#   }
# }


# data "aws_iam_policy_document" "codebuild_policy_doc" {
#   # Permissions for VPC configuration of CodeBuild project
#   dynamic "statement" {
#     for_each = try(var.vpc_config.vpc_id, "") != "" ? [1] : []

#     content {
#       effect    = "Allow"
#       resources = ["*"]
#       actions = [
#         "ec2:CreateNetworkInterface",
#         "ec2:DescribeDhcpOptions",
#         "ec2:DescribeNetworkInterfaces",
#         "ec2:DeleteNetworkInterface",
#         "ec2:DescribeSubnets",
#         "ec2:DescribeSecurityGroups",
#         "ec2:DescribeVpcs"
#       ]
#     }
#   }

#   # Permissions for VPC configuration of CodeBuild project
#   dynamic "statement" {
#     for_each = try(var.vpc_config.vpc_id, "") != "" && length(try(var.vpc_config.subnets, [])) > 0 ? [1] : []

#     content {
#       effect    = "Allow"
#       resources = ["arn:aws:ec2:${local.aws_region}:${local.aws_account_id}:network-interface/*"]
#       actions = [
#         "ec2:CreateNetworkInterfacePermission"
#       ]
#       condition {
#         test = "ArnLike"
#         values = [
#           for subnet in var.vpc_config.subnets :
#           "arn:aws:ec2:${local.aws_region}:${local.aws_account_id}:subnet/${subnet}"
#         ]
#         variable = "ec2:Subnet"
#       }
#     }
#   }

#   statement {
#     effect    = "Allow"
#     resources = ["arn:aws:logs:${local.aws_region}:${local.aws_account_id}:*:*"]
#     actions = [
#       "logs:CreateLogGroup",
#       "logs:CreateLogStream",
#       "logs:PutLogEvents"
#     ]
#   }

#   statement {
#     effect = "Allow"
#     # Chris Ballment 2024-02-24: ignoring false positive
#     # tfsec:ignore:aws-iam-no-policy-wildcards
#     resources = [
#       "${data.aws_s3_bucket.codepipeline_bucket.arn}/*"
#     ]
#     actions = [
#       "s3:GetObject",
#       "s3:GetObjectVersion",
#       "s3:PutObject",
#     ]
#   }

#   statement {
#     effect = "Allow"
#     resources = [
#       data.aws_s3_bucket.codepipeline_bucket.arn,
#     ]
#     actions = [
#       "s3:GetBucketVersioning",
#       "s3:ListBucketVersions",
#     ]
#   }

#   statement {
#     effect    = "Allow"
#     resources = ["arn:aws:codebuild:${local.aws_region}:*:report-group/*"]
#     actions = [
#       "codebuild:CreateReportGroup",
#       "codebuild:CreateReport",
#       "codebuild:UpdateReport",
#       "codebuild:BatchPutTestCases",
#       "codebuild:BatchPutCodeCoverages"
#     ]
#   }

#   dynamic "statement" {
#     for_each = toset(local.referenced_ssm)

#     content {
#       effect    = "Allow"
#       resources = [data.aws_ssm_parameter.referenced[statement.key].arn]
#       actions = [
#         "ssm:GetParameter",
#         "ssm:GetParameters",
#         "ssm:GetParametersByPath",
#       ]
#     }
#   }

#   dynamic "statement" {
#     for_each = toset(local.referenced_secretsmanager)

#     content {
#       effect    = "Allow"
#       resources = [statement.key]
#       actions = [
#         "secretsmanager:DescribeSecret",
#         "secretsmanager:GetSecretValue",
#         "secretsmanager:ListSecretVersionIds"
#       ]
#     }
#   }

#   dynamic "statement" {
#     for_each = local.build_projects

#     content {
#       effect    = module.codebuild_key[statement.key].permission_block["effect"]
#       resources = module.codebuild_key[statement.key].permission_block["resources"]
#       actions   = module.codebuild_key[statement.key].permission_block["actions"]
#     }
#   }

#   dynamic "statement" {
#     for_each = var.codebuild_additional_permissions
#     content {
#       effect    = statement.value["effect"]
#       resources = statement.value["resources"]
#       actions   = statement.value["actions"]
#     }
#   }
# }

