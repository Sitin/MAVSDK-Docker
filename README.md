MAVSDK-Docker
=============

Dockerized [MAVSDK](https://github.com/mavlink/MAVSDK) server.

[DockerHub](https://hub.docker.com/r/sitin/mavsdk).

> **WARNING!!!**
> 
> This is unofficial image. Once MAVSDK community decide to create an official image, this repository will be either
> archived or turned into the set of tools to build MAVSDK server for a custom MAVLink dialect.

Usage
-----

Run the latest image (we use `-sig-proxy=false` to allow Ctr+C) on gRPC port (`50051`) and expose default UDP port for
incoming MAVLink connections (`14540` by default):

```shell
docker run --rm --sig-proxy=false -p 50051:50051 -p 14540:14540/udp -- sitin/mavsdk:latest -p 50051
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
