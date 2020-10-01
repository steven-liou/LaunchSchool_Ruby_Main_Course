threads=(1 2 4 8 16 32 64)

for t in ${threads[@]} 
do
    echo "$t"
done

for i in ${!threads[@]}
do
    echo "Index is $i"
done

