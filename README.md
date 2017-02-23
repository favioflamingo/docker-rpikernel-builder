# docker-rpikernel-builder
Dockerfile to build a kernel for the Raspberry Pi

Before starting, the user building the kernel inside the container may have a different uid than the user building the image. 

To build:

```
docker build -t rpi-builder:1 --build-arg proxy="yourrepoproxy:3142" --build-arg append="custom-test1" --build-arg branch=rpi-4.4.y --network networkofyourproxy -f Dockerfile.amd64 .
```

To run:

```
cat /tmp/myconfig.txt | docker run --rm=true --name=rpi-kernel-builder.run -v $(pwd):/tmp/target -t rpi-kernel-builder:rpi-4.4.y rpi-4.4.y customname1
```
