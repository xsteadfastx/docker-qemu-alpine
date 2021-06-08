# just a crappy alpine vm in a docker container

## mount volume in vm

        mount -t 9p -o trans=virtio,version=9p2000.L host0 /mnt
