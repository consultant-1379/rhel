#!/bin/bash

# This installs Virtualbox guest additions.

. /tmp/functions.sh

if [[ "${PACKER_BUILDER_TYPE}" == "virtualbox-iso" ]];then
cecho "\n *** Installing Virtualbox Guest Additions ***\n" $GREEN


# Some settings to keep things generic.
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
VBOX_ISO=/tmp/VBoxGuestAdditions_$VBOX_VERSION.iso
VBOX_MNTDIR=$(mktemp --tmpdir=/tmp -q -d -t vbox_mnt_XXXXXX)

# Install tools.
mount -o loop $VBOX_ISO $VBOX_MNTDIR
yes|sh $VBOX_MNTDIR/VBoxLinuxAdditions.run --nox11 --keep

# Clean up.
umount $VBOX_MNTDIR
rm -rf $VBOX_MNTDIR
rm -f $VBOX_ISO
fi
