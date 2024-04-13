account=$1
version=$2

echo "Building $account/ubuntu-sqitch:$version image..."

# build the Docker image
docker buildx build -t $account/ubuntu-sqitch:$version --push .;

# push the image
docker push $account/ubuntu-sqitch:$version;