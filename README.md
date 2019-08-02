<h1 align="center">Welcome to Jenkins with ECS Slaves - Example 👋</h1>
<p>
  <img src="https://img.shields.io/badge/version-v0.0.1-blue.svg?cacheSeconds=2592000" />
  <a href="https://twitter.com/fidelissauro">
    <img alt="Twitter: fidelissauro" src="https://img.shields.io/twitter/follow/fidelissauro.svg?style=social" target="_blank" />
  </a>
</p>

> How to use ECS Cluster to build your applications with Jenkins

## Create Cluster with Terraform - Example for testing.

```sh
cd terraform/
terraform init
terraform apply
```


```
Apply complete! Resources: 17 added, 0 changed, 0 destroyed.

Outputs:

server_configs =

Cluster Example for Jenkins Slaves

Put this informations on your Jenkins master configuration.

Manage Jenkins –> Configure System  -> Add a new cloud -> Amazon EC2 Container Service Cloud

* Cluster Name: jenkins-ecs-build
* Cluster ARN: arn:aws:ecs:us-east-1:xxxxxxxxxx:cluster/jenkins-ecs-build
* Cluster Region: us-east-1
* Subnets ID's: subnet-0a905f91dab361f2a, subnet-05fcd0a6745b4a258
* Security Group for your task: sg-02afde594f30c786f
```



## Author

👤 **Matheus Fidelis**

* Twitter: [@fidelissauro](https://twitter.com/fidelissauro)
* Github: [@msfidelis](https://github.com/msfidelis)

## Show your support

Give a ⭐️ if this project helped you!

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_