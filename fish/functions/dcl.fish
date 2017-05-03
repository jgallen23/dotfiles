function dcl
  docker run -it -e DOCKERCLOUD_NAMESPACE="$DOCKERCLOUD_NAMESPACE" -v ~/.docker:/root/.docker:ro --rm dockercloud/cli $argv
end
