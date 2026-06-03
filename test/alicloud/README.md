- 执行命令
```bash
cd test/alicloud/network/vswitch
rm -rf .terraform .terraform.lock.hcl
terraform init
terraform plan -var-file=../../terraform.tfvars
```
<br>


### terraform.tfvars 模版
```tfvars
access_key = ""
secret_key = ""
```
