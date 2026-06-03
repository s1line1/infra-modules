- 执行命令
```bash
cd test/alicloud/network/vswitch
rm -rf .terraform .terraform.lock.hcl
# 如果网络有问题 可以走代理:  https_proxy=proxy_url http_proxy=proxy_url terraform init
terraform init
terraform plan -var-file=../../terraform.tfvars
```
<br>


### terraform.tfvars 模版
```tfvars
access_key = ""
secret_key = ""
```
