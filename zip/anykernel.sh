# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() {
kernel.string=NotKernel by jonsnow @ xda-developers
do.devicecheck=0
do.modules=0
do.cleanup=1
do.cleanuponabort=1
device.name1=mido
device.name2=Redmi Note 4
device.name3=Redmi Note 4x
device.name4=HMNote4x
device.name5=Redmi Note 4X
} # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;

## end setup


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;

## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;


## AnyKernel install
dump_boot;

# begin ramdisk changes

# insert init.spectrum.rc in init.rc
#Spectrum
if [ -e init.qcom.rc ]; then
backup_file init.qcom.rc;
insert_line init.qcom.rc "init.spectrum.rc" before "import init.qcom.usb.rc" "import /init.spectrum.rc";
else
backup_file init.rc;
insert_line init.rc "init.spectrum.rc" before "import /init.usb.rc" "import /init.spectrum.rc";
fi;

# end ramdisk changes

write_boot;

## end install
