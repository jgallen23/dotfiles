function ag-replace
  echo "Replacing $argv[1] with $argv[2]"
  ag -0 -l $argv[1] | xargs -0 sed -ri -e "s/$argv[1]/$argv[2]/g"
end
