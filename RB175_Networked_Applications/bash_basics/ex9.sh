integer=7

if ! ([ $integer -eq ]) || ! ([ $integer -eq 6 ])
then
  echo $integer is not 5 or 6
fi
