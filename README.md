# CInet tools container

This repository contains a `Containerfile` which can be used with `docker`
or `podman` to create an (Arch Linux-based) environment in which all the
CInet tools in their current latest version are installed:

``` console
$ podman build --format=docker --tag=cinet/all .
```

Note that `--format=docker` is required to use the `SHELL` command.
Afterwards, you can run `CInet` computations in a container:

``` console
$ podman run cinet/all perl -MCInet::Gaussoids -E 'say Gaussoids(4)->count'
679
```

To save and share the image, use

``` console
$ podman save cinet/all | zstd -o cinet-all.tar.zst
```

The whole image is quite big at 2.4 GiB. With zstd compression, it comes
down to about 820 MiB. The image can be downloaded from <https://cinet.link/install>.
