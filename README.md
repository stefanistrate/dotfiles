# dotfiles

Configs for frequently used tools.

## Installation

1. Clone repo with:

    ```bash
    git clone --recurse-submodules https://github.com/stefanistrate/dotfiles.git
    ```

2. Install configs for [supported tools](tools) with:

    ```bash
    ./install
    ```

3. If needed, manually restore backups for [optional tools](backups) by following their specific instructions.

4. Change shell to `zsh` with:

    ```bash
    chsh -s $(which zsh)
    ```

## Snapshots

Currently, the following system info is periodically saved into this repo, to facilitate future system recoveries:

* The list of installed applications (macOS).
* The list of installed fonts (macOS).
* The list of installed Homebrew packages (macOS).

## Licenses

* Most configs are licensed under the [MIT License](LICENSE.md) by Ștefan Istrate.
* [`tools/vim/after/indent/python.vim`](tools/vim/after/indent/python.vim) is licensed under the [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0) by Google LLC.
