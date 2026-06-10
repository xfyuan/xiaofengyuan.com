[![Lint](https://github.com/xfyuan/xiaofengyuan.com/actions/workflows/lint.yml/badge.svg)](https://github.com/xfyuan/xiaofengyuan.com/actions/workflows/lint.yml)

# Personal Site

My xiaofengyuan.com site based on Jekyll.

## ENV Setup

```bash
# Jekyll setup
bundle install

# Lint setup
brew install yamllint autocorrect
npm install -g markdownlint-cli2
```

## Lint

```bash
# Lint all
make lint

# Fix lint issues
make fix
```
