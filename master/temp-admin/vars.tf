variable "key" {
  description = "Enter the pgp key to encrypt the secret_key (to decrypt: terraform output secret_key | base64 --decode | gpg -d)"
}

variable "infosec_acct_id" {}
variable "aws_default_region" {}
variable "terraform_state_bucket" {}
variable "terraform_state_bucket_region" {}
