# Guide to make system image (Linux or macOS)
run following codes to fetch needed repos in ~/AndroidWorkspace:
```
mkdir ~/AndroidWorkspace
cd ~/AndroidWorkspace
git clone https://github.com/erfanoabdi/Capire-Le-Treble.git
git clone https://github.com/erfanoabdi/P_semiGSI.git
git clone https://github.com/erfanoabdi/ROM_resigner.git
git clone https://github.com/LineageOS/android_build.git
```
### Get latest "marlin" (Pixel XL 1gen) P firmware and mount system.img of it somewhere (for example `~/AndroidWorkspace/system`)
### Use simg2img for sparse image conversion

### Lets make the image

### A-Only:
```
cd ~/AndroidWorkspace/Capire-Le-Treble/Extra
sudo ./sGSI-ify.sh ~/AndroidWorkspace/system/system 2147483648 ~/AndroidWorkspace/sGSI_A.img
<wait until you see "Press any key to continue">
```
### and open another terminal tab (use python 2.x):
```
cd ~/AndroidWorkspace/ROM_resigner
sudo python resign.py ~/AndroidWorkspace/Capire-Le-Treble/Extra/tmp/system ~/AndroidWorkspace/android_build/target/product/security
cd ~/AndroidWorkspace/P_semiGSI/systemimgmaker
sudo ./make.sh ~/AndroidWorkspace/Capire-Le-Treble/Extra/tmp/system
```
### close this terminal tab and go back to previous tab (sGSI-ify.sh) and press any key.

### AB:
```
cd ~/AndroidWorkspace/Capire-Le-Treble/Extra
sudo ./sGSI-ify_ab.sh ~/AndroidWorkspace/system 2147483648 ~/AndroidWorkspace/sGSI_AB.img
<wait until you see "Press any key to continue">
```
### and open another terminal tab (use python 2.x):
```
cd ~/AndroidWorkspace/ROM_resigner
sudo python resign.py ~/AndroidWorkspace/Capire-Le-Treble/Extra/tmp/system/system ~/AndroidWorkspace/android_build/target/product/security
cd ~/AndroidWorkspace/P_semiGSI/systemimgmaker
sudo ./makeab.sh ~/AndroidWorkspace/Capire-Le-Treble/Extra/tmp/system
```
### close this terminal tab and go back to previous tab (sGSI-ify_ab.sh) and press any key.
