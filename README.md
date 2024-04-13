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

4. Restore [backups](backups) manually.

5. Change login shell to `zsh` with:

    ```bash
    chsh -s $(which zsh)
    ```

## Snapshots

Periodically, the following system info is saved into the [snapshots](snapshots) folder, to facilitate future system recoveries:

- The list of installed applications (macOS).
- The list of installed fonts (macOS).
- The list of installed Homebrew packages (macOS).

## Licenses

Configs are licensed under the [MIT License](LICENSE.md) by Ștefan Istrate, except for...

- [`managed_tools/vim/after/indent/python.vim`](managed_tools/vim/after/indent/python.vim): licensed under [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0) by Google LLC.
