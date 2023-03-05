# https://hub.docker.com/_/busybox https://busybox.net/
ARG BUSYBOX_VERSION=1.35-musl

# https://github.com/awesome-containers/static-*
ARG BASE=ghcr.io/awesome-containers
ARG BASH_VERSION=latest
ARG COREUTILS_VERSION=latest
ARG GREP_VERSION=latest
ARG SED_VERSION=latest
ARG FINDUTILS_VERSION=latest
ARG GAWK_VERSION=latest
ARG PROCPS_VERSION=latest
ARG CURL_VERSION=latest
ARG OPENSSL_VERSION=latest
ARG OPENSSH_VERSION=latest

FROM docker.io/busybox:$BUSYBOX_VERSION AS busybox
FROM $BASE/static-coreutils:$COREUTILS_VERSION AS static-coreutils
FROM $BASE/static-bash:$BASH_VERSION AS static-bash
FROM $BASE/static-grep:$GREP_VERSION AS static-grep
FROM $BASE/static-sed:$SED_VERSION AS static-sed
FROM $BASE/static-findutils:$FINDUTILS_VERSION AS static-findutils
FROM $BASE/static-gawk:$GAWK_VERSION AS static-gawk
FROM $BASE/static-procps:$PROCPS_VERSION AS static-procps
FROM $BASE/static-curl:$CURL_VERSION AS static-curl
FROM $BASE/static-openssl:$CURL_VERSION AS static-openssl
FROM $BASE/static-openssh:$OPENSSH_VERSION AS static-openssh

FROM scratch
COPY --from=static-coreutils /etc/passwd /etc/group /etc/
COPY --from=busybox /bin/ /bin/
COPY --from=static-coreutils /bin/ /bin/
COPY --from=static-grep /bin/grep /bin/fgrep /bin/egrep /bin/
COPY --from=static-sed /bin/sed /bin/sed
COPY --from=static-findutils /bin/find /bin/locate /bin/updatedb /bin/xargs /bin/
COPY --from=static-gawk /bin/ /bin/
COPY --from=static-procps /bin/ /bin/
COPY --from=static-curl /bin/curl /bin/curl
COPY --from=static-openssl /bin/openssl /bin/openssl
ENV OPENSSL_CONF=/etc/openssl.cnf
COPY --from=static-openssl /etc/openssl.cnf /etc/openssl.cnf
ENV SSL_CERT_DIR=/etc/ssl/certs
ENV SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
COPY --from=static-openssl /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=static-openssh /etc/sshd_config /etc/
COPY --from=static-openssh /bin/scp /bin/sftp /bin/ssh /bin/ssh-keygen /bin/ssh-keyscan /bin/ssh-keysign /bin/

COPY --from=static-bash /bin/bash /bin/bash
ENTRYPOINT ["/bin/bash"]
