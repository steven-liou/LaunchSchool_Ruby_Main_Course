counter=0
max=10

while [ $counter -le $max]
do
    each $counter
    ((counter++))
done
