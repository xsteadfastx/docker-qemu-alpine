# just a crappy alpine vm in a docker container

## mount volume in vm

        mount -t 9p -o trans=virtio,version=9p2000.L host0 /mnt

## running it

        docker run --rm -ti -p 5022:22 -v /home/marv/tmp:/SWAP ghcr.io/xsteadfastx/qemu-alpine:latest
