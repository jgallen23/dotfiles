function eb
  docker run \
    --rm -it \
    -v "$HOME/.aws:/root/.aws" \
    -v "$PWD:$PWD" \
    -w "$PWD" \
    allthings/awsebcli $argv;
end
