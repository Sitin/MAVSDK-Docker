MAVSDK-Docker
=============

Dockerized [MAVSDK](https://github.com/mavlink/MAVSDK) server.

[DockerHub](http://coming.soon/).

> **WARNING!!!**
> 
> This is unofficial image. Once MAVSDK community decide to create an official image, this repository will be either
> archived or turned into the set of tools to build MAVSDK server for a custom MAVLink dialect.

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
