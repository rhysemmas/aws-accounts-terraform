`Notes`

This is my butchered version, it probably won't work for you

!!!!!!!!!!!!!!</br>
TF v0.11.9</br>
TG v0.17.0</br>
!!!!!!!!!!!!!!</br>

[init.sh](./master/init.sh) - I have modified the init script to decrypt the IAM user secret using gpg (rather than keybase) as I did not want to add my private PGP key to keybase's keyring</br>
[organization/main.tf](./master/organization/main.tf) - comment out lines 8-10 if SSO is NOT enabled for your org (it wont be on first run through)</br>
[organization/main.tf](./master/organization/main.tf) - line 49: messed up the account alias for my master account so added a '2' to create a new alias. You may wish to remove this random '2' yourself.</br>

# AWS Organization Terraform

This repository contains the Terraform configurations needed to manage a multi-account AWS organization and the various roles that will be used within the accounts.

At Liatrio, we used this as the foundation for our accounts. We created a private fork that contains the actual users and resources used in our accounts.

Related blog post: [liatrio.com/blog/secure-aws-account-structure-with-terraform-and-terragrunt](https://www.liatrio.com/blog/secure-aws-account-structure-with-terraform-and-terragrunt)

Be sure to modify `shared.tfvars` to customize for your organization.

## Prerequisites

- [Terraform](https://www.terraform.io/)
- [Terragrunt](https://github.com/gruntwork-io/terragrunt)
- [Keybase](https://keybase.io) account (only required during initialization to get a secret key for the initial admin user)

## Initialization

See the [master](master) folder for initial setup instructions the first time the organization is being created.

## Post-Initialization

Future Terraform runs must be run by an IAM user in the Infosec account with the appropriate group assignment for the target account:

- Infosec account: `InfosecAdmins` group
- Prod account: `ProdAdmins` group
- Non-Prod account: `NonProdAdmins` group
