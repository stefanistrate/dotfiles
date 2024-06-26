#!/usr/bin/env bash

set -e

CONFIG="install.conf.yaml"
DOTBOT_DIR="dotbot"
DOTBOT_BIN="bin/dotbot"
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Sync dotbot.
cd "${BASEDIR}"
git -C "${DOTBOT_DIR}" submodule sync --quiet --recursive
git submodule update --init --recursive "${DOTBOT_DIR}"

# Run dotbot.
"${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" -c "${CONFIG}" "${@}"

# Install crontab only on the personal macOS computer.
while true; do
    read -p "Is this your personal macOS computer? (y/N) " yn
    case $yn in
        [yY])
            echo "Installing crontab"

            (
                crontab -l 2> /dev/null | ( grep -v "# MANAGED_BY_DOTFILES" || [[ $? == 1 ]] )
                cat managed_tools/cron/crontab | sed "s#DOTFILES_DIR#$(pwd)#"
            ) | crontab -

            break
            ;;
        [nN] | "")
            break
            ;;
        *)
            ;;
    esac
done
