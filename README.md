# OpenAI Code Review Action

This action uses the OpenAI API to review code changes in a pull request.

Fork of [sshnaidm/gpt-code-review-action](https://github.com/sshnaidm/gpt-code-review-action).

## Usage

To use this action, include it as a step in your workflow, after the checkout step.

The commented-out inputs below show their default values.

```yaml

on: [pull_request]

jobs:
  code-review:
    runs-on: ubuntu-latest
    permissions:
      contents: read
      pull-requests: write
    steps:
      # This step checks out a copy of your repository.
      - uses: actions/checkout@v3
      # This step references the directory that contains the action.
      - uses: ChaoticRoman/gpt-code-review-action@v13
        with:
          openai-key: ${{ secrets.OPENAI_API_KEY }}
          # model: 'gpt-5.2-codex'
          # max-length: 20000
          # prompt: 'Explain and review following patch:'
          # post-if-error: true

```

The action will post the OpenAI review as a comment on the pull request.

### Requirements

To post comments in Pull Requests, the job requires additional permissions: `pull-requests: write`. However, since this permission implies "explicit deny," we also need to mention the default permission `contents: read`.

### Inputs

`openai-key`: The OpenAI API key used for authentication (**required**).

`model`: The OpenAI language model to use for code review (optional, defaults to `gpt-5.2-codex`).

`prompt`: The prompt to use for the analysis (optional, defaults to `'Explain and review following patch:'`).

`max-length`: The maximum number of characters of the diff to submit to OpenAI (optional, defaults to `20000`).

`post-if-error`: Whether to post a comment if there was an error (optional, defaults to `true`).

`github-token`: The token used to authenticate with the GitHub API (optional, defaults to `${{ github.token }}`).

## Contributing

Contributions to this action are welcome! Please create an issue or pull request in the repository.

## Testing

You can run `./test.sh` that just verifies that the Python code is able to send something to the cheapest OpenAI model and get something out of it. (The model is kindly asked to tell "It works!").

The test expects you have Python 3.14 available as it is the one used in the action itself. There is an appropriate file `.python_version` for [pyenv](https://github.com/pyenv/pyenv).

## License

This action is licensed under the Apache 2.0 License. See the LICENSE file for details
