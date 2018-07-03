# aws-cli-helpers

The missing AWS CLI commands and completions

## Commands

### `amp`

('Amazon Profile'). Switch to a profile configured in your `~/.aws/config` file.
Supports tab completion for your profiles.
See
[Named Profiles](https://docs.aws.amazon.com/cli/latest/userguide/cli-multiple-profiles.html)
in the AWS docs for more details.

### `amr`

('Amazon Region').  Switch to a specific region.  Will autocomplete regions as
long as you current have valid AWS credentials.

## Usage

Just source `aws-helpers.sh` in your `.bashrc`, for example by adding the
following:

```
. $HOME/aws-cli-helpers/aws-helpers.sh
```
