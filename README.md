MAVSDK-Docker
=============

[![Publish to Docker registry](https://github.com/Sitin/MAVSDK-Docker/actions/workflows/main.yml/badge.svg)](https://github.com/Sitin/MAVSDK-Docker/actions/workflows/main.yml)
[![Update latest tag according to MAVSDK](https://github.com/Sitin/MAVSDK-Docker/actions/workflows/update-tags.yml/badge.svg)](https://github.com/Sitin/MAVSDK-Docker/actions/workflows/update-tags.yml)

Dockerized [MAVSDK](https://github.com/mavlink/MAVSDK) server.

[DockerHub](https://hub.docker.com/r/sitin/mavsdk).

CI/CD is configured to automatically release new image on new MAVSDK tag (scheduled run twice per day).
See [`.github/workflows/update-tags.yml`](.github/workflows/update-tags.yml) and [`update-tags.sh`](update-tags.sh).

> **WARNING!!!**
> 
> This is unofficial image. Once MAVSDK community decide to create an official image, this repository will be either
> archived or turned into the set of tools to build MAVSDK server for a custom MAVLink dialect.
> 
> We suggest to always use a specific version tag for MAVSDK (e.g. `sitin/mavsdk:1.4.4` instead of just `sitin/mavsdk`).

Usage
-----

Run the `1.4.4` image (we use `-sig-proxy=false` to allow Ctr+C) on gRPC port (`50051`) and expose default UDP port for
incoming MAVLink connections (`14540` by default):

```shell
docker run --rm --sig-proxy=false -p 50051:50051 -p 14540:14540/udp sitin/mavsdk:1.4.4 -p 50051
```

Development
-----------

Create a platform-specific build:

```shell
make build
```

Start the server:

```shell
make up
```

Run tests (multiplatform build):

```shell
make test
```

Clean up:

```shell
make clean
```
