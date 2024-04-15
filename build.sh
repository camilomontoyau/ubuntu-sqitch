account=$1
version=$2

echo "Building $account/ubuntu-sqitch:$version image..."

# build the Docker image
docker buildx build -t $account/ubuntu-sqitch:$version --push .;

# push the image
docker push $account/ubuntu-sqitch:$version;

# build the Docker image for amd64
docker buildx build --platform linux/amd64 -t $account/ubuntu-sqitch:$version-amd64 --push .;

# push the image for amd64
docker push $account/ubuntu-sqitch:$version-amd64;
