# GitHub Actions Lint

[![GitHub License](https://img.shields.io/github/license/koki-develop/github-actions-lint)](./LICENSE)
[![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/koki-develop/github-actions-lint/release-please.yml)](./.github/workflows/release-please.yml)

Lint GitHub Actions workflows.

## Usage

```yaml
jobs:
  github-actions-lint:
    runs-on: ubuntu-latest
    permissions:
      contents: read
    steps:
      - uses: actions/checkout@v4

      # actionlint (https://github.com/rhysd/actionlint)
      # For more details: https://github.com/koki-develop/github-actions-lint/blob/main/actionlint/action.yml
      - uses: koki-develop/github-actions-lint/actionlint@v1

      # ghalint (https://github.com/suzuki-shunsuke/ghalint)
      # For more details: https://github.com/koki-develop/github-actions-lint/blob/main/ghalint/action.yml
      - uses: koki-develop/github-actions-lint/ghalint@v1
        with:
          action-path: ./.github/actions/**/action.yml

      # zizmor (https://github.com/zizmorcore/zizmor)
      # For more details: https://github.com/koki-develop/github-actions-lint/blob/main/zizmor/action.yml
      - uses: koki-develop/github-actions-lint/zizmor@v1
        with:
          github-token: ${{ github.token }}
          persona: auditor
```

## License

[MIT](./LICENSE)
