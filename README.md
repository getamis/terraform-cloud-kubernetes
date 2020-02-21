[![CircleCI](https://circleci.com/gh/getamis/terraform-cloud-kubernetes.svg?style=svg)](https://circleci.com/gh/getamis/terraform-cloud-kubernetes) [![GitHub license](https://img.shields.io/github/license/getamis/terraform-cloud-kubernetes)](https://github.com/getamis/terraform-cloud-kubernetes/blob/master/LICENSE)
# Terraform Cloud Kubernetes Modules
Those modules are handle Kubernetes service of a cloud platform, which includes EKS, GKE and AKS. 

> Now, only support EKS cluster.

## Requirements
This module is only meant for use with Terraform *0.12+*.

## Usage
There are multiple examples included in the [examples](./examples/) folder.

## Modules
This repo includes serveral major modules:

### aws/network
Create one AWS VPC including private and public subnet, and one ec2 instance called bastion hosts in public subnet, hence, one can access the resource hosting in the private subnet, refer [**aws/network**](VARIABLES.md#aws/network) for the detail variable inputs.

### aws/eks
This two modules creates the Kubernetes control plane(AWS EKS), Terraform is responsible for the complicated Kubernetes compoments, and it takes about 10~15 minutes to complete, refer [**aws/eks**](VARIABLES.md#aws/eks) for the detail variable inputs.

### aws/eks-worker-asg
Create a AWS auto-scaling group with CoreOS container linux and leverage ignition to provision and register to EKS cluster or ElastiKube automatically.

Due to using AWS launch template, hence, it's up to user to choose spot or on demand instance type by changing the variable, refer [**aws/eks-worker**](VARIABLES.md#aws/eks-worker) for the detail variable inputs.

## Contributing
There are several ways to contribute to this project:

1. **Find bug**: create an issue in our Github issue tracker.
2. **Fix a bug**: check our issue tracker, leave comments and send a pull request to us to fix a bug.
3. **Make new feature**: leave your idea in the issue tracker and discuss with us then send a pull request!

## License
This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details.
