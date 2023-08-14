# dotfiles

Configs for common tools.

## Installation

1. Clone repository with:

    ```bash
    git clone --recurse-submodules https://github.com/stefanistrate/dotfiles.git
    ```

1. Install configs for [essential tools](tools) with:

    ```bash
    ./install
    ```

1. Install configs for [extra tools](extras) manually.

1. Change shell to `zsh` with:

    ```bash
    chsh -s $(which zsh)
    ```

## Licenses

* Most configs are licensed under the [MIT License](LICENSE.md) (by Ștefan Istrate).
* [`tools/vim/after/indent/python.vim`](tools/vim/after/indent/python.vim) is licensed under the [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0) (by Google LLC).
