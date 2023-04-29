# dotfiles

Configs for common tools.

## Installation

1. Clone repository with:

```bash
git clone --recurse-submodules https://github.com/stefanistrate/dotfiles.git
```

2. Install configs for [`managed/`](managed) tools with:

```bash
./install
```

3. Install configs for [`unmanaged/`](unmanaged) tools manually.

4. Change shell to `zsh` with:

```bash
chsh -s $(which zsh)
```

## Licenses

* Most configs are licensed under the [MIT License](LICENSE.md) (by Ștefan Istrate).
* [`managed/vim/after/indent/python.vim`](managed/vim/after/indent/python.vim) is licensed under the [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0) (by Google LLC).
