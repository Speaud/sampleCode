dirs=( $(ls tmp/) )

for dir in "${dirs[@]}"; do
    [ -f tmp/$dir ] && cp tmp/$dir tmp/tmp/$(echo $dir | sed 's/test/asdf/g')
done

#arr=( $(ls tmp/) )

#echo ${!arr[@]} # keys

#echo ${arr[@]} # values

