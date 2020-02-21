# Variables

## aws/eks

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aws\_auth\_config\_output\_flag | Whether to write the aws-auth configmap file. | string | `"true"` | no |
| aws\_region | The AWS region to build eks cluster | string | `""` | no |
| cidr\_access\_eks\_https | The CIDR block of AWS VPC for eks cluster | list | `<list>` | no |
| cidr\_access\_worker\_ssh | The CIDR block of AWS VPC for eks cluster | list | `<list>` | no |
| config\_output\_path | The path to store config, e.g. kubeconfig | string | `"./terraform"` | no |
| endpoint\_private\_access | Kubernetes apiserver endpoint | string | `"true"` | no |
| endpoint\_public\_access | Kubernetes apiserver endpoint | string | `"false"` | no |
| exist\_subnet\_ids | The exist AWS subnet ids for EKS cluster | list | n/a | yes |
| extra\_tags | Extra AWS tags to be applied to created resources. | map | `<map>` | no |
| iam\_path | If provided, all IAM roles will be created on this path. | string | `"/"` | no |
| kubeconfig\_aws\_authenticator\_additional\_args | Any additional arguments to pass to the authenticator such as the role to assume. e.g. ["-r", "MyEksRole"]. | list | `<list>` | no |
| kubeconfig\_aws\_authenticator\_command | Command to use to fetch AWS EKS credentials. | string | `"aws-iam-authenticator"` | no |
| kubeconfig\_aws\_authenticator\_command\_args | Default arguments passed to the authenticator command. Defaults to [token -i $cluster_name]. | list | `<list>` | no |
| kubeconfig\_aws\_authenticator\_env\_variables | Environment variables that should be used when executing the authenticator. e.g. { AWS_PROFILE = "eks"}. | map | `<map>` | no |
| kubeconfig\_name | Override the default name used for items kubeconfig. | string | `""` | no |
| kubeconfig\_output\_flag | Whether to write a Kubectl config file containing the cluster configuration. Saved to `config_output_path`. | string | `"true"` | no |
| kubernetes\_version | Desired Kubernetes master version. If you do not specify a value, the latest available version is used. | string | `"1.12.7"` | no |
| lb\_sg\_ids | The security group id which used by load balancer | list | `<list>` | no |
| local\_exec\_interpreter | Command to run for local-exec resources. Must be a shell-style interpreter. If you are on Windows Git Bash is a good choice. | list | `<list>` | no |
| manage\_aws\_auth | Whether to apply the aws-auth configmap file. | string | `"true"` | no |
| map\_accounts | Additional AWS account numbers to add to the aws-auth configmap. See examples/eks_test_fixture/variables.tf for example format. | list | `<list>` | no |
| map\_accounts\_count | The count of accounts in the map_accounts list. | string | `"0"` | no |
| map\_roles | Additional IAM roles to add to the aws-auth configmap. See examples/eks_test_fixture/variables.tf for example format. | list | `<list>` | no |
| map\_roles\_count | The count of roles in the map_roles list. | string | `"0"` | no |
| map\_users | Additional IAM users to add to the aws-auth configmap. See examples/eks_test_fixture/variables.tf for example format. | list | `<list>` | no |
| map\_users\_count | The count of roles in the map_users list. | string | `"0"` | no |
| permissions\_boundary | If provided, all IAM roles will be created with this permissions boundary attached. | string | `""` | no |
| phase | Specific which phase is used for this eks cluster, and phase + project become cluster name | string | `"test"` | no |
| project | Specific which project is used by eks cluster, and phase + project become cluster name | string | `"vishwakarma"` | no |
| worker\_groups | The worker groups's name for generating role | list | `<list>` | no |

### Outputs

| Name | Description |
|------|-------------|
| endpoint | the eks cluster endpoint |
| id | the eks cluster name |
| kubernetes\_version | the eks cluster version |
| s3\_bucket | the s3 bucket where put kubeconfig |
| worker\_instance\_profiles | the instance profiles name for worker groups |
| worker\_role\_arns | the role arns for worker groups |
| worker\_sg\_id | the security group id for worker group |

## aws/eks-worker

### Inputs
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aws\_az\_number | How many AZs want to use | string | `"3"` | no |
| aws\_region | The AWS region | string | `"us-west-2"` | no |
| cluster\_name | the eks cluster name | string | n/a | yes |
| enable\_autoscaler | enable autoscaler or not | string | `"false"` | no |
| extra\_tags | Extra AWS tags to be applied to created resources. | map | `<map>` | no |
| extra\_worker\_policy\_arns | The extra policy need to be attached to worker | list | `<list>` | no |
| kube\_node\_labels | Labels to add when registering the node in the cluster. Labels must be key=value pairs. | list | `<list>` | no |
| kube\_node\_taints | Register the node with the given list of taints ("<key>=<value>:<effect>"). | list | `<list>` | no |
| load\_balancer\_ids | A list of elastic load balancer names to add to the autoscaling group names. Only valid for classic load balancers. For ALBs, use target_group_arns instead. | list | `<list>` | no |
| security\_group\_ids | List of security group IDs for the cross-account elastic network interfaces     to use to allow communication between your worker nodes and the Kubernetes control plane. | list | `<list>` | no |
| ssh\_key | The key name that should be used for the instance. | string | `""` | no |
| subnet\_ids | List of subnet IDs. Must be in at least two different availability zones.     Cross-account elastic network interfaces will be created in these subnets to allow     communication between your worker nodes and the Kubernetes control plane. | list | `<list>` | no |
| target\_group\_arns | A list of aws_alb_target_group ARNs, for use with Application Load Balancing. | list | `<list>` | no |