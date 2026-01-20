#!/usr/bin/env bash

set -euo pipefail

install_dir="${HOME}/.local/bin"

[ -d "${install_dir}" ] || mkdir -p "${install_dir}"
[ -f "${install_dir}/mise" ] && exit 0

export MISE_INSTALL_PATH="${install_dir}/mise"
curl https://mise.run | sh
