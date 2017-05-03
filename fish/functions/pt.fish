function pt
  docker run -e PAPERTRAIL_API_TOKEN=$PAPERTRAIL_API_TOKEN --rm firstandthird/papertrail-cli $argv
end
