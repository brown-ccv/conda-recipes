for p in $(<packages-missing.txt)
do
  grep "not exist on the local" /cran/logs/${p}.log
  if [ $? == 0 ]
  then
    R CMD INSTALL /cran/src/contrib/${p}_*.tar.gz &>/cran/logs/${p}.log
  fi
done
