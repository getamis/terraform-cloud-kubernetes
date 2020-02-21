variable "aws_region" {
  description = "The AWS region to build eks cluster"
  type        = string
  default     = ""
}

variable "cidr_access_eks_https" {
  description = "The CIDR block of AWS VPC for eks cluster"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "cidr_access_worker_ssh" {
  description = "The CIDR block of AWS VPC for eks cluster"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "exist_subnet_ids" {
  description = "The exist AWS subnet ids for EKS cluster"
  type        = list(string)
}

variable "phase" {
  description = "Specific which phase is used for this eks cluster, and phase + project become cluster name"
  type        = string
  default     = "test"
}

variable "project" {
  description = "Specific which project is used by eks cluster, and phase + project become cluster name"
  type        = string
  default     = "vishwakarma"
}

variable "kubernetes_version" {
  type        = string
  default     = "1.14"
  description = "Desired Kubernetes master version. If you do not specify a value, the latest available version is used."
}

variable "config_output_path" {
  description = "The path to store config, e.g. kubeconfig"
  type        = string
  default     = "./.terraform"
}

variable "kubeconfig_aws_authenticator_command" {
  description = "Command to use to fetch AWS EKS credentials."
  type        = string
  default     = "aws-iam-authenticator"
}

variable "kubeconfig_aws_authenticator_command_args" {
  description = "Default arguments passed to the authenticator command. Defaults to [token -i $cluster_name]."
  type        = list(string)
  default     = []
}

variable "kubeconfig_aws_authenticator_additional_args" {
  description = "Any additional arguments to pass to the authenticator such as the role to assume. e.g. [\"-r\", \"MyEksRole\"]."
  type        = list(string)
  default     = []
}

variable "kubeconfig_aws_authenticator_env_variables" {
  description = "Environment variables that should be used when executing the authenticator. e.g. { AWS_PROFILE = \"eks\"}."
  type        = map(string)
  default     = {}
}

variable "kubeconfig_output_flag" {
  description = "Whether to write a Kubectl config file containing the cluster configuration. Saved to `config_output_path`."
  type        = bool
  default     = true
}

variable "manage_aws_auth" {
  description = "Whether to apply the aws-auth configmap file."
  type        = bool
  default     = true
}

variable "aws_auth_config_output_flag" {
  description = "Whether to write the aws-auth configmap file."
  type        = bool
  default     = true
}

variable "kubeconfig_name" {
  description = "Override the default name used for items kubeconfig."
  type        = string
  default     = ""
}

variable "worker_groups" {
  description = "The worker groups's name for generating role"
  type        = list(string)
  default     = []
}

variable "permissions_boundary" {
  description = "If provided, all IAM roles will be created with this permissions boundary attached."
  type        = string
  default     = ""
}

variable "iam_path" {
  description = "If provided, all IAM roles will be created on this path."
  type        = string
  default     = "/"
}

variable "map_accounts" {
  description = "Additional AWS account numbers to add to the aws-auth configmap. See examples/eks_test_fixture/variables.tf for example format."
  type        = list(string)
  default     = []
}

variable "map_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap. See examples/eks_test_fixture/variables.tf for example format."
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))
  default = []
}

variable "map_users" {
  description = "Additional IAM users to add to the aws-auth configmap. See examples/eks_test_fixture/variables.tf for example format."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))
  default = []
}

variable "lb_sg_ids" {
  description = "The security group id which used by load balancer"
  type        = list(string)
  default     = []
}

variable "endpoint_private_access" {
  description = "Kubernetes apiserver endpoint"
  type        = bool
  default     = true
}

variable "endpoint_public_access" {
  description = "Kubernetes apiserver endpoint"
  type        = bool
  default     = false
}

variable "local_exec_interpreter" {
  description = "Command to run for local-exec resources. Must be a shell-style interpreter. If you are on Windows Git Bash is a good choice."
  type        = list(string)
  default     = ["/bin/sh", "-c"]
}

variable "extra_tags" {
  description = "Extra AWS tags to be applied to created resources."
  type        = map(string)
  default     = {}
}
