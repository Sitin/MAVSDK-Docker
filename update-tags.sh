#!/usr/bin/env sh

set -e

###############################################################################
# Config
###############################################################################

repo_url=https://github.com/Sitin/MAVSDK-Docker.git
mavsdk_repo_url=https://github.com/mavlink/MAVSDK.git

###############################################################################
# Getting the latest tags
###############################################################################

latest_tag=$(git -c 'versionsort.suffix=-' ls-remote --tags --sort='v:refname' "${repo_url}" \
            | tail --lines=1 \
            | awk -F/ '{ print $3 }')

latest_mavsdk_tag=$(git -c 'versionsort.suffix=-' ls-remote --tags --sort='v:refname' "${mavsdk_repo_url}" \
                    | tail --lines=1 \
                    | awk -F/ '{ print $3 }')

echo "Latest tag: '${latest_tag}'. Latest MAVSDK tag: '${latest_mavsdk_tag}'."

###############################################################################
# Set latest MAVSDK tag if not set
###############################################################################

if [ "${latest_tag}" = "${latest_mavsdk_tag}" ]; then
  echo "Latest tags are in sync, nothing to update."
else
  echo "Setting the latest git tag to '${latest_mavsdk_tag}'."
  git tag "${latest_mavsdk_tag}"
fi
