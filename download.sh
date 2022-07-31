#!/usr/bin/env sh

set -e

platform="${TARGETPLATFORM:-UNKNOWN}"
_tag="${MAVSDK_TAG:-vUNKNOWN}"
# shellcheck disable=SC2039
version="${_tag:1}"
destination="${1:-${PWD}/mavsdk-server}"

if [ "${platform}" = "UNKNOWN" ]; then echo "ERROR: Target platform is not set!"; exit 1; fi
if [ "${version}" = "UNKNOWN" ]; then echo "ERROR: Target version is not set!"; exit 1; fi

# Naming conventions match v1.4.4 (https://github.com/mavlink/MAVSDK/releases/tag/v1.4.4)
case "${platform}" in
  linux/arm64)
    distribution=mavsdk_server_linux-arm64-musl
    ;;
   linux/amd64)
    distribution=mavsdk_server_musl_x86_64
    ;;
   linux/arm/v6)
    distribution=mavsdk_server_linux-armv6-musl
    ;;
   linux/arm/v7)
    distribution=mavsdk_server_linux-armv7l-musl
    ;;
  *)
    echo "Unsupported platform: ${platform}"
    exit 1
esac

load_url="https://github.com/mavlink/MAVSDK/releases/download/v${version}/${distribution}"

echo "Loading MAVSDK distribution from ${load_url}"
curl -L "${load_url}" -o "${destination}"
chmod +x "${destination}"
