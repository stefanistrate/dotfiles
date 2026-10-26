# dotfiles

Configs for frequently used tools.

## Installation

1. Clone repo with:

    ```bash
    git clone --recurse-submodules https://github.com/stefanistrate/dotfiles.git
    ```

    If the repo was already cloned without `--recurse-submodules`, fetch the submodules
    from inside the repo with:

    ```bash
    git submodule update --init --recursive
    ```

2. Install configs for [managed tools](managed_tools), all at once, with:

    ```bash
    ./install.sh
    ```

3. Change login shell to `zsh` with:

    ```bash
    chsh -s $(which zsh)
    ```

## Development

Install [pre-commit](https://pre-commit.com) (e.g. `brew install pre-commit`), then install the git hooks so file-hygiene and secret-scanning checks run automatically before each commit:

```bash
pre-commit install
```

Run all hooks on demand against every file in the repo:

```bash
pre-commit run --all-files
```

Bump the hook versions in [`.pre-commit-config.yaml`](.pre-commit-config.yaml) with:

```bash
pre-commit autoupdate
```

## Licenses

Configs are licensed under the [MIT License](LICENSE.md) by Ștefan Istrate, except for...

- [`managed_tools/vim/after/indent/python.vim`](managed_tools/vim/after/indent/python.vim): licensed under [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0) by Google LLC.
