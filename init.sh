#!/usr/bin/env bash

set -eu

filename=task_linux_amd64.tar.gz
tmpdir=$(mktemp --directory)

curl --silent --show-error --location --output-dir "${tmpdir}" --remote-name "https://github.com/go-task/task/releases/download/v3.43.3/${filename}"
tar --directory "${HOME}/.local/bin" -xzf "${tmpdir}/${filename}" task
