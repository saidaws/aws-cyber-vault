# AWS Terraform Module Template

[![checkov](https://github.com/EMOrg-Prd/backup-lag-vault/actions/workflows/checkov.yml/badge.svg)](https://github.com/EMOrg-Prd/backup-lag-vault/actions/workflows/checkov.yml)[![tflint](https://github.com/EMOrg-Prd/backup-lag-vault/actions/workflows/tflint.yml/badge.svg)](https://github.com/EMOrg-Prd/backup-lag-vault/actions/workflows/tflint.yml)[![terraform-docs](https://github.com/EMOrg-Prd/backup-lag-vault/actions/workflows/terraform-docs.yml/badge.svg)](https://github.com/EMOrg-Prd/backup-lag-vault/actions/workflows/terraform-docs.yml)

This repository provides the template to use for all Terraform Modules.

<!-- TOC -->

- [AWS Terraform Module Template](#aws-terraform-module-template)
  - [Repository configuration checklist](#repository-configuration-checklist)
  - [Useful notes](#useful-notes)
  - [Requirements](#requirements)
  - [Providers](#providers)
  - [Modules](#modules)
  - [Resources](#resources)
  - [Inputs](#inputs)
  - [Outputs](#outputs)

<!-- /TOC -->

## Repository configuration checklist

> Perform all the steps identified as **General steps** and follow the next steps depending on the scenario that this template will be used.

1. General steps:

- [ ] Update the [CONTRIBUTING.md](./CONTRIBUTING.md) file to reflect the current repository
- [ ] Update the [CODEOWNERS](./CODEOWNERS) file with the users or groups that should review pull requests
- [ ] (Optional) Install [Pre-Commit Hooks](./CONTRIBUTING.md#install-pre-commit-hooks)
- [ ] (Optional) Install [Visual Studio Code Recommended Extensions](./CONTRIBUTING.md#install-visual-studio-code-recommended-extensions)
- [ ] Update the [description](./README.md#terraform-module-template) in this [README.md](./README.md) file to reflect the solution the module is implementing.
- [ ] Create a branch protection rule for your production environment. Goto Settings -> Environments -> Select your production environment -> select **require reviewers** and protect main branch. In case that you have the enforcer to configure security settings, remember to add your service account as Admin in the collaborators panel (Github settings) and tag your repo accordingly. Refer to: [Github Repo Enforcer tool](https://github.com/ExxonMobil/github-action-repo-enforcer/).

2. Depending on the scenario, you should select one of the following options.

> Scenario 1: Deployment repository:

- [ ] Create the repository secrets, variables and environments as documented in the [Terraform Reusable Workflow Prerequisites](https://github.com/ExxonMobil/awsce-terraform-reusable-workflow#prerequisites).
- [ ] Update the [Deploy workflow](./.github/workflows/deploy.yml). Follow reusable workflow documentation: [Reusable workflow](https://github.com/ExxonMobil/awsce-terraform-reusable-workflow).
- [ ] (Optional) Update the [Destroy workflow](./.github/workflows/destroy.yml). Follow reusable workflow documentation: [Reusable workflow](https://github.com/ExxonMobil/awsce-terraform-reusable-workflow). If there are no intention on the destroy functionality, please remove the workflow file.
- [ ] Remove examples folder entirely if your are not going to use it.
- [ ] Remove modules folder entirely if your are not going to use nested modules.

> Scenario 2: Terraform reusable module:

- [ ] Name the repository to follow the naming convention `terraform-aws-<application-name>`.
- [ ] Update the content of the `locals.tf` file to what is needed by the reusable module. Usually, `tags` are not created by reusable modules, but rather by modules that call the reusable module.
- [ ] Remove `providers.tf` file.
- [ ] Delete [envs](./envs/) folder.
- [ ] Delete [terraform.tfvars](./terraform.tfvars) file.
- [ ] Delete [.github/workflows/deploy.yml](.github/workflows/deploy.yml) file.
- [ ] Delete [.github/workflows/destroy.yml](.github/workflows/destroy.yml) file.
- [ ] Update `examples` folder with an example calling the reusable module. Use a [Git URL](https://developer.hashicorp.com/terraform/language/modules/sources#generic-git-repository) selecting the latest [revision](https://developer.hashicorp.com/terraform/language/modules/sources#selecting-a-revision) to source the reusable module.
- [ ] If you're planning to use nested modules, add it on the modules folder and enable terraform docs action to be recursive: update **_recursive_** option to true in [.github/workflows/terraform-docs.yml](.github/workflows/terraform-docs.yml).

3. General final steps:

- [ ] Delete this checklist.
- [ ] Delete/Modify Useful notes as needed... and start coding!

## Useful notes (Remove or keep it as needed)

- **envs** folder is to define your non-sensitive terraform variables per environment.
- if you have a solution based on a lambda, add new folder called src or lambda to the root directory and place your code there.
- In the **.github/workflows** folder there are plenty of examples that could be leveraged by your project or not, feel free to use it or delete it as needed.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=4.0.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >=3.0.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cyber_recovery_lag_vault"></a> [backup\_lag\_vault](#module\_backup\_lag\_vault) | ./modules/backup-lag-vault | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | The environment where to deploy the solution | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region where to deploy the resources | `string` | n/a | yes |
| <a name="input_cyberapp_principals"></a> [cyberapp\_principals](#input\_cyberapp\_principals) | target AWS account IDs for sharing the vault | `list(string)` | `[]` | no |
| <a name="input_enable_resource_sharing"></a> [enable\_resource\_sharing](#input\_enable\_resource\_sharing) | Whether to enable resource sharing or not | `bool` | `true` | no |
| <a name="input_max_retention_days"></a> [max\_retention\_days](#input\_max\_retention\_days) | maximum retention days of the backup vault data | `number` | `365` | no |
| <a name="input_min_retention_days"></a> [min\_retention\_days](#input\_min\_retention\_days) | minimum retention days of the backup vault data | `number` | `30` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
