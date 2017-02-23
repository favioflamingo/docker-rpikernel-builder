# docker-rpikernel-builder
Dockerfile to build a kernel for the Raspberry Pi

Before starting, the user building the kernel inside the container may have a different uid than the user building the image. 

To build:

```
docker build -t rpi-builder:1 --build-arg proxy="yourrepoproxy:3142" --build-arg append="custom-test1" --build-arg branch=rpi-4.4.y --network networkofyourproxy -f Dockerfile.amd64 .
```

If there is no local apt cache available, then just run:

```
docker build -t rpi-builder:1  --build-arg append="custom-test1" --build-arg branch=rpi-4.4.y  -f Dockerfile.amd64 .
```


To run:

```
docker run --rm=true --name=rpi.run -a STDOUT rpi-builder:1 send | tar -xvf - -C ./
```

The above command will deposit the deb packages in the current directory.
