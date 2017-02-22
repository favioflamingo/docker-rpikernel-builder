# docker-rpikernel-builder
Dockerfile to build a kernel for the Raspberry Pi

Before starting, the user building the kernel inside the container may have a different uid than the user building the image. 

To build:

```
docker build -t rpi-kernel-builder:rpi-4.4.y -f Dockerfile.amd64 .
```

To run:

```
docker run --rm=true --name=rpi-kernel-builder.run -v $(pwd):/tmp/target -it rpi-kernel-builder:rpi-4.4.y rpi-4.4.y customname1
```
