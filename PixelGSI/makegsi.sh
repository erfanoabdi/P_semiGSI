#/bin/bash

aosppath=/Volumes/AB_P.img/system
rootpath=/Users/erfanabdi/GitHub/208868/Extra/tmp/system
systempath=$rootpath/system
thispath=`pwd`

# set signatures
cp -fpr $thispath/plat_mac_permissions.xml $systempath/etc/selinux
# remove pixel stuffs
$thispath/AB2A.sh $thispath/unpixelify.txt $systempath
# Fix broken Symlinks
$thispath/ln.sh $systempath
# vndk-27
cp -fpr $aosppath/etc/init/gsi $systempath/etc/init/
cp -fpr $aosppath/etc/init/init.gsi.rc $systempath/etc/init/
cp -fpr $aosppath/etc/ld.config.27.txt $systempath/etc/
cp -fpr $aosppath/etc/ld.config.vndk_lite.txt $systempath/etc/
cp -fpr $aosppath/etc/llndk.libraries.27.txt $systempath/etc/
cp -fpr $aosppath/etc/vndksp.libraries.27.txt $systempath/etc/
cp -fpr $aosppath/lib/vndk-27 $systempath/lib/
cp -fpr $aosppath/lib/vndk-sp-27 $systempath/lib/
cp -fpr $aosppath/lib64/vndk-27 $systempath/lib64/
cp -fpr $aosppath/lib64/vndk-sp-27 $systempath/lib64/
# wificonf
echo "/system/bin/wificonf        u:object_r:wificond_exec:s0" >> $systempath/etc/selinux/plat_file_contexts
cp -fpr $thispath/wificonf/wificonf $systempath/bin/
cp -fpr $thispath/wificonf/wificonf.rc $systempath/etc/init/
# adb fix
echo "sys.usb.ffs.aio_compat=1" >> $systempath/etc/prop.default
# pixel theme
echo "ro.boot.vendor.overlay.theme=com.google.android.theme.pixel" >> $systempath/etc/prop.default
# overlays
cp -fpr $thispath/overlay $systempath/product/
# enable P hotness
echo "persist.sys.overlay.photness=true" >> $systempath/etc/prop.default
# disable setupwizard
echo "ro.setupwizard.mode=DISABLED" >> $systempath/etc/prop.default
# fix marlin plat_service_contexts
sed -i "/qti.ims.connectionmanagerservice/d" $systempath/etc/selinux/plat_service_contexts
