#!/bin/bash
name=e653lwin-$(date +%d%m%y)-$md5.zip
export myPath=$(pwd)
export ARCH=arm
make -j4 msm8909-e653lwin_defconfig
make -j4
if [ $? -eq 0 ]; then
mkdir e653lwin
cp arch/arm/boot/zImage arch/arm/tools/flash/zImage
scripts/dtbTool -s 2048 -o arch/arm/tools/flash/dt.img -p scripts/dtc/ arch/arm/boot/
cd arch/arm/tools/flash/
zip -r flash.zip anykernel.sh META-INF/ tools/ zImage dt.img
rm dt.img zImage
md5=$(md5sum flash.zip | awk '{ print $1 }' | cut -c-5)
name=e653lwin-$(date +%d%m%y)-$md5.zip
mv flash.zip $myPath/e653lwin/$name
else
    echo FAIL
fi
