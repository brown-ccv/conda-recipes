for p in $(diff packages.txt packages-installed.txt | grep "^<" | cut -f2 -d' ')
do
  grep "not available for package" /cran/logs/${p}.log &>/dev/null
  if [ $? == 1 ]
  then
    echo $p
  fi
done
