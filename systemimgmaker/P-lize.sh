#/bin/sh

filename="$1"
pvendor="$2"
vendordir="$3"
while read -r line
do
    echo 'set_perm(0, 0, 0644, "/vendor/'$line'");'
    file=`echo "$line" | cut -d ":" -f 2 | cut -d "|" -f 1`
    filedir=`echo $file | rev | cut -d "/" -f 2- | rev`
    sudo mkdir -p "$vendordir/$filedir"
    sudo cp -fpr "$pvendor/$file" "$vendordir/$filedir/"
done < "$filename"
