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
First build a tarball package:
```shell
# Create orig tarball (excluding debian directory)
tar --exclude='nimv/debian' -czf nimv_0.0.2.orig.tar.gz nimv/
```

Then sign the package:
```shell
cd nimv
debuild -S -sa # This will use your GPG key to sign the package
cd ..
dput -f nimv nimv_0.0.2-2ubuntu1_source.changes
```

