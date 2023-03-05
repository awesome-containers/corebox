# Statically linked Coreutils

Statically linked Coreutils 9.1 container image with Bash 5.2

```bash
ghcr.io/awesome-containers/static-coreutils:latest
ghcr.io/awesome-containers/static-coreutils:9.1

docker.io/awesomecontainers/static-coreutils:latest
docker.io/awesomecontainers/static-coreutils:9.1
```

Slim statically linked Coreutils 9.1 container image with Bash 5.2 packaged with UPX

```bash
ghcr.io/awesome-containers/static-coreutils:latest-slim
ghcr.io/awesome-containers/static-coreutils:9.1-slim

docker.io/awesomecontainers/static-coreutils:latest-slim
docker.io/awesomecontainers/static-coreutils:9.1-slim
```

https://www.gnu.org/software/coreutils/
http://git.savannah.gnu.org/cgit/coreutils.git
https://github.com/awesome-containers/slim-static-bash


podman build -t corebox -f Containerfile . --no-cache
podman build -t corebox:slim -f Containerfile-slim . --no-cache
podman build -t corebox:alpine -f Containerfile-alpine . --no-cache
podman inspect localhost/corebox | jq '.[].Size' | numfmt --to=iec
podman inspect localhost/corebox:slim | jq '.[].Size' | numfmt --to=iec
podman inspect localhost/corebox:alpine | jq '.[].Size' | numfmt --to=iec
