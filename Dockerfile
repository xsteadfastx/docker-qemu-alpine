FROM alpine:3.13

RUN set -ex \
 && apk add \
        qemu-system-x86_64 \
        samba-server

EXPOSE 22

VOLUME /SWAP

ADD https://alpine.global.ssl.fastly.net/alpine/v3.14/releases/x86_64/netboot/vmlinuz-virt /netboot/vmlinuz-virt
ADD https://alpine.global.ssl.fastly.net/alpine/v3.14/releases/x86_64/netboot/initramfs-virt /netboot/initramfs-virt

CMD \
	qemu-system-x86_64 \
	-m 2048 \
	-nographic \
	-net nic \
	-net user,hostfwd=tcp::22-:22 \
	-virtfs local,path=/SWAP,mount_tag=host0,security_model=passthrough,id=host0 \
	-kernel /netboot/vmlinuz-virt \
	-initrd /netboot/initramfs-virt \
	-append "console=ttyS0 ip=dhcp alpine_repo=http://dl-cdn.alpinelinux.org/alpine/v3.14/main/ ssh_key=https://raw.githubusercontent.com/xsteadfastx/docker-qemu-alpine/main/ssh.pub"
