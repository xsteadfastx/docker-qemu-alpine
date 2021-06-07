FROM alpine:3.13

RUN set -ex \
 && apk add \
        qemu-system-x86_64 \
        samba-server

ADD root.qcow2 /

EXPOSE 22

CMD qemu-system-x86_64 -m 2048 -hda root.qcow2 -nographic -net nic -net user,hostfwd=tcp::22-:22
