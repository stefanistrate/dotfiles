# dotfiles

Configs for frequently used tools.

## Installation

1. Clone repo with:

    ```bash
    git clone --recurse-submodules https://github.com/stefanistrate/dotfiles.git
    ```

2. Install configs for [managed tools](managed_tools), all at once, with:

    ```bash
    ./install.sh
    ```

3. Install configs for [sudo tools](sudo_tools), individually, with:

    ```bash
    sudo sudo_tools/[TOOL]/install.sh
    ```

4. Change login shell to `zsh` with:

    ```bash
    chsh -s $(which zsh)
    ```

## Licenses

Configs are licensed under the [MIT License](LICENSE.md) by Ștefan Istrate, except for...

- [`managed_tools/vim/after/indent/python.vim`](managed_tools/vim/after/indent/python.vim): licensed under [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0) by Google LLC.
