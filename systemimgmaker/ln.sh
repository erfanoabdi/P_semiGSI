#/bin/bash

declare -a partitions=(
boot-framework-oahl-backward-compatibility.vdex
)

for partition in "${partitions[@]}"
do
    rm -rf "$1/framework/arm64/$partition"
    ln -s "/system/framework/$partition" "$1/framework/arm64/$partition"
    rm -rf "$1/framework/arm/$partition"
    ln -s "/system/framework/$partition" "$1/framework/arm/$partition"
done

