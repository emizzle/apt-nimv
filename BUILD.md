# Build

## Build the Docker image

```shell
docker build -t debian-builder .
```

## Run the container with your package directory mounted

```shell
docker run -it \
  -v $(pwd):/build \
  -v $HOME/.gnupg:/root/.gnupg \
  -v $HOME/.dput.cf:/root/.dput.cf \
  debian-builder

# The .deb file will be created in your current directory
```

### Inside the container

```shell
cd nimv
debuild -S -sa # This will use your GPG key to sign the package
cd ..
dput ppa nimv_0.0.1_source.changes
```

