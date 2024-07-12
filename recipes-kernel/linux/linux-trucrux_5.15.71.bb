# Copyright (C) 2013-2016 Freescale Semiconductor
# Copyright 2017 NXP
# Copyright Trucrux.
# Released under the MIT license (see COPYING.MIT for the terms)

SUMMARY = "Linux kernel provided and supported by Trucrux"
DESCRIPTION = "Linux kernel provided and supported by Trucrux (based on the kernel provided by NXP) \
with focus on i.MX Family SOMs. It includes support for many IPs such as GPU, VPU and IPU."

require recipes-kernel/linux/linux-imx.inc
include linux-common.inc

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"

DEPENDS += "lzop-native bc-native"

# Do not copy the kernel image to the rootfs by default
RDEPENDS_${KERNEL_PACKAGE_NAME}-base = ""

DEFAULT_PREFERENCE = "1"

LOCALVERSION:imx8mq-trux-q01 = "-imx8mq"
LOCALVERSION:imx8mm-trux-q01 = "-imx8mm"

KBUILD_DEFCONFIG:imx8mq-trux-q01 = "imx8mq_trucrux_defconfig"
KBUILD_DEFCONFIG:imx8mm-trux-q01 = "imx8_trux_defconfig"

DEFAULT_DTB:imx8mq-trux-q01 = "sd-hdmi"
DEFAULT_DTB_PREFIX:imx8mq-trux-q01 = "imx8mq-trux-8MDVP"

SRC_URI = "${KERNEL_SRC};branch=${SRCBRANCH}"

S = "${WORKDIR}/git"

pkg_postinst:kernel-devicetree:append () {
    rm -f $D/boot/devicetree-*
}

pkg_postinst:kernel-devicetree:append:imx8mq-trux-q01 () {
    cd $D/boot
    ln -s ${DEFAULT_DTB_PREFIX}-${DEFAULT_DTB}.dtb ${DEFAULT_DTB_PREFIX}.dtb
}


# Added by meta-virtualization/recipes-kernel/linux/linux-yocto_5.4_virtualization.inc
KERNEL_FEATURES:remove = "cfg/virtio.scc"

COMPATIBLE_MACHINE = "(mx6-nxp-bsp|mx7-nxp-bsp|mx8-nxp-bsp)"
