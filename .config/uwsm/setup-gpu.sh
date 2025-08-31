#!/bin/bash

# Consistent GPU path symlink setup at /dev/dri path. This script is only responsible to creating the rule files for
# intel igpu and nvidia dgpu (my current setup), we need to run this commands once after this script:
#
# ```
# sudo udevadm control --reload
# sudo udevadm trigger
#
# ```
#
# > See more: https://wiki.hypr.land/Configuring/Multi-GPU/#creating-consistent-device-paths-for-specific-cards
#
# NOTE:
# - fix: remove the leading `0000` from `KERNELS` variable for `udevadm` to successfully create the symlink

setup_gpu() {
  local gpu_name=""
  local gpu_id=""
  local rule_path=""
  local udev_rule=""

  if [ "${#}" -eq 0 ]; then
    echo error: empty argument
    return 1
  fi

  gpu_name=$1
  gpu_id=$(lspci -d ::03xx | grep -i "${gpu_name}" | cut -f1 -d' ')

  # Early exit for not found gpu_name
  if [ -z "${gpu_id}" ]; then
    echo unknown \'"${gpu_name}"\' GPU name
    return 1
  fi

  rule_path="/etc/udev/rules.d/${gpu_name}-dev-path.rules"
  udev_rule="$(
    cat <<EOF
KERNEL=="card*", \
KERNELS=="${gpu_id}", \
SUBSYSTEM=="drm", \
SUBSYSTEMS=="pci", \
SYMLINK+="dri/${gpu_name}"
EOF
  )"

  echo "${udev_rule}" | sudo tee "${rule_path}"
}

setup_gpu intel
setup_gpu nvidia
