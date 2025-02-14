## Build the test Docker image

```shell
# Build the test Docker image
docker build -t ubuntu-tester -f Dockerfile.test .

# Run the container
docker run -it ubuntu-tester

# Inside the container:
add-apt-repository ppa:egonatura/nimv
apt-get update
apt-get install nimv
```
