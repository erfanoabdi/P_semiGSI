#/bin/sh

filename="$1"
while read -r line
do
    sudo rm -rf "$line" "$2/$line"
done < "$filename"
