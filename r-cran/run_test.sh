for p in $(<packages-installed.txt)
do
  R -e "library($p)"
done
