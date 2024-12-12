# Contributing Guidelines

Please read through this document before submitting any pull requests to ensure we have all the necessary information to effectively review your changes.

## Requirements

The following tools need to be installed on your local machine:

### Mandatory

* [Visual Studio Code](https://code.visualstudio.com/)
* [pre-commit](https://pre-commit.com/)
* [tfenv](https://github.com/tfutils/tfenv)
* [tflint](https://github.com/terraform-linters/tflint)
* [terraform-docs](https://github.com/terraform-docs/terraform-docs)
* [checkov](https://github.com/bridgecrewio/checkov)

### Recommended

* [oh-my-zsh](https://ohmyz.sh/)
* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
* [spaceship-prompt](https://github.com/spaceship-prompt/spaceship-prompt)

## Local Development Setup

Run these steps before making changes to the code. They will help automate the commands to lint the code or run tests. These steps help to ensure high code quality and reduce the likelihood that the changes inadvertently break something.

### Install Visual Studio Code recommended extensions

Install Visual Studio Code [recommended extensions](https://code.visualstudio.com/docs/editor/extension-marketplace#_recommended-extensions) defined in [.vscode/extensions.json](.vscode/extensions.json) to improve you productivity and increase code quality.

### Install latest terraform version

```shell
tfenv install latest
tfenv use latest
```

### Install pre-commit hooks

> This will ensure that the commands we want to execute before each commit are executed automatically.

```shell
pip install pre-commit
pre-commit install
```

**NOTE**: bear in mind that pre-commit tool require python and pip installed in your machine.

### Execute pre-commit hooks manually on all files

```shell
# All hooks
pre-commit run --all-files

# Checkov
pre-commit run checkov --all-files

# Terraform docs
pre-commit run terraform_docs --all-files
```

### Update pre-commit hooks

```shell
pre-commit autoupdate
```

## Contributing via Pull Requests

Contributions via pull requests are mandatory.

Before sending the team a pull request, please ensure that:

1. You check existing open, and recently merged, pull requests to make sure someone else hasn't addressed the problem already.
1. Your change is related to an existing user story that has been refined and approved.
1. Create a branch. Development happens on feature and bug-fix branches that branch off of the main branch.
    * Name feature branches **feature/feature-name**.
    * Name bug-fix branches **fix/bugfix-name**.
1. Modify the source; please focus on the specific change you are contributing. If you also reformat all the code, it will be hard for the reviewers to focus on your change.
1. Ensure local tests and pre-commit hooks pass.
1. Commit to your branch using clear commit messages.

To create a pull request, please:

1. Raise a draft/WIP pull request to get early feedback or start a discussion whenever necessary.
1. Create a pull request, answering any default questions in the pull request interface. A reviewer should be assigned and start reviewing in less than 24 hours. If nobody is available, inform your team lead ASAP. Users defined in the [CODEOWNERS](./CODEOWNERS) file will be automatically requested for review when someone opens a pull request.
1. Pay attention to any automated CI failures reported in the pull request, and stay involved in the conversation.
1. Add a comment with a link to the pull request in your user story and inform the team in Slack that you are ready for a review.

[creating a pull request](https://help.github.com/articles/creating-a-pull-request/).

When reviewing a pull request:

1. Validate that the CI steps have executed successfully.
1. Validate that the change aligns with the team’s coding practices.
1. If necessary, test the change in your developer's sandbox.
1. Ensure that you follow-up on your request for any change requests or PR comments.
1. If you won’t be around to follow-up (e.g., on PTO), ensure that you notify the PR author and agree on what will be the next steps.

## Merging and Releasing

1. Use Git Squash to merge pull requests to the main branch to condense the commit messages into one commit. This help removing the abundance of superfluous commit messages that do nothing more than muddle up a git log.
1. Delete the merged branch from the repository.
1. Create a release using automatically generated release notes and tags based on [semantic versioning](https://semver.org/) guidelines.

    > Release titles and tags should be `vX.X.X`
