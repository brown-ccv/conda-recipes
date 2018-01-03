for p in $(<packages-missing.txt)
do
  if [ ! -d $R_LIBS/$p ]
  then
    R -e "install.packages('$p', repos='file:///cran/')" &>/cran/logs/${p}.log
  fi
done
ls -1 $R_LIBS >packages-installed.txt
