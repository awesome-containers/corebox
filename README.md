# CoreBox

CoreBox is a set of statically linked utilities for writing your scripts.

It's almost like BusyBox only more powerful, it's based on [BusyBox],
Bash, Coreutils, Grep, OpenSSH, OpenSSL, Curl and more.

## Components

* [static-bash] `ghcr.io/awesome-containers/static-bash:latest`
* [static-coreutils] `ghcr.io/awesome-containers/static-coreutils:latest`
* [static-grep] `ghcr.io/awesome-containers/static-grep:latest`
* [static-sed] `ghcr.io/awesome-containers/static-sed:latest`
* [static-findutils] `ghcr.io/awesome-containers/static-findutils:latest`
* [static-gawk] `ghcr.io/awesome-containers/static-gawk:latest`
* [static-procps] `ghcr.io/awesome-containers/static-procps:latest`
* [static-curl] `ghcr.io/awesome-containers/static-curl:latest`
* [static-openssl] `ghcr.io/awesome-containers/static-openssl:latest`
* [static-openssh] `ghcr.io/awesome-containers/static-openssh:latest`

## Image

> ~ 40M

```bash
ghcr.io/awesome-containers/corebox:latest
ghcr.io/awesome-containers/corebox:0.1.0

docker.io/awesomecontainers/corebox:latest
docker.io/awesomecontainers/corebox:0.1.0
```

Slim CoreBox packaged with [UPX]

> ~ 18M

```bash
ghcr.io/awesome-containers/corebox:latest-slim
ghcr.io/awesome-containers/corebox:0.1.0-slim

docker.io/awesomecontainers/corebox:latest-slim
docker.io/awesomecontainers/corebox:0.1.0-slim
```

[UPX]: https://upx.github.io/
[BusyBox]: https://busybox.net/

[static-bash]: https://github.com/awesome-containers/static-bash
[static-coreutils]: https://github.com/awesome-containers/static-coreutils
[static-grep]: https://github.com/awesome-containers/static-grep
[static-sed]: https://github.com/awesome-containers/static-sed
[static-findutils]: https://github.com/awesome-containers/static-findutils
[static-gawk]: https://github.com/awesome-containers/static-gawk
[static-procps]: https://github.com/awesome-containers/static-procps
[static-curl]: https://github.com/awesome-containers/static-curl
[static-openssl]: https://github.com/awesome-containers/static-openssl
[static-openssh]: https://github.com/awesome-containers/static-openssh

<!--
```bash
image="localhost/${PWD##*/}"

podman build -t "$image:latest" --no-cache --pull .
podman build -t "$image:latest-slim" -f Containerfile-slim --no-cache --pull .

echo "$image:latest"
podman inspect "$image:latest" | jq '.[].Size' | numfmt --to=iec
echo "$image:latest-slim"
podman inspect "$image:latest-slim" | jq '.[].Size' | numfmt --to=iec

```
-->
