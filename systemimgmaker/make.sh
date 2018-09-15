#/bin/bash

systempath=$1
thispath=`pwd`

cp -fpr $thispath/plat_mac_permissions.xml $systempath/etc/selinux
#prop.default
sed -i "s/persist.sys.usb.config=none/persist.sys.usb.config=adb/g" $systempath/etc/prop.default
echo "ro.setupwizard.wifi_required=false" >> $systempath/etc/prop.default
echo "ro.setupwizard.enable_bypass=1" >> $systempath/etc/prop.default
echo "ro.setupwizard.require_network=any" >> $systempath/etc/prop.default
echo "ro.setupwizard.mode=DISABLED" >> $systempath/etc/prop.default
#ims
rm -rf $systempath/app/ims
#ld.config
cp -fpr $thispath/ld.config.vndk_lite.txt $systempath/etc
$thispath/AB2A.sh $thispath/A.txt $systempath
# Fix broken Symlinks
$thispath/ln.sh $systempath
#Selinux Plat Services
sed -i "/qti.ims.connectionmanagerservice/d" $systempath/etc/selinux/plat_service_contexts
sed -i "/cneservice/d" $systempath/etc/selinux/plat_service_contexts
#libselinux
cp -fpr $thispath/64/libselinux.so $systempath/lib64/
cp -fpr $thispath/32/libselinux.so $systempath/lib/
#CNEService
cp -fpr $thispath/CNEService.apk $systempath/priv-app/CNEService/
#remove google cam
rm -rf $systempath/app/GoogleCamera
#incall
cp -fpr $thispath/QtiAudio $systempath/priv-app/
