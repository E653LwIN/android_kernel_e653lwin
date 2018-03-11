# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

properties() {
kernel.string=kernel for e653lwin 
do.devicecheck=0
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=maguro
device.name2=toro
device.name3=toroplus
device.name4=
device.name5=
} 
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;

. /tmp/anykernel/tools/ak2-core.sh;

dump_boot;

write_boot;

