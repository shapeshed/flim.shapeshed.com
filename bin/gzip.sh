find build -type f | \
  while read -r x
  do
    gzip -c -9 "$x" > "$x.gz"
  done
