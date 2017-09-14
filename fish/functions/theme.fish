function theme
  docker run --rm -it -v $PWD:/theme firstandthird/shopify-themekit $argv
end
