account=$1
version=$2

echo "Building $account/ubuntu-sqitch:$version image..."

# build the Docker image
docker buildx build --platform linux/amd64,linux/arm64 -t $account/ubuntu-sqitch:$version --push .;

# push the image
docker push $account/ubuntu-sqitch:$version;