require trucrux-mirrors.inc
INHERIT += "image-buildinfo"

MACHINE_FEATURES += " pci bluetooth wifi"

IMX_DEFAULT_BSP = "nxp"

USE_VT = "0"

KERNEL_IMAGETYPE:mx8-nxp-bsp = "Image.gz"

SOC_DEFAULT_WKS_FILE:mx8-nxp-bsp = "imx-imx-boot-bootpart1.wks.in"

DEFAULTTUNE:mx8mq-nxp-bsp  ?= "cortexa53-crypto"
DEFAULTTUNE:mx8mm-nxp-bsp  ?= "cortexa53-crypto"

# Trucrux BSP default providers
PREFERRED_PROVIDER_u-boot = "u-boot-trucrux"
PREFERRED_PROVIDER_u-boot-fw-utils = "u-boot-fw-utils"
PREFERRED_PROVIDER_virtual/bootloader = "u-boot-trucrux"
PREFERRED_PROVIDER_virtual/kernel = "linux-trucrux"

# Use i.MX Gstreamer Version
MACHINE_GSTREAMER_1_0_PLUGIN:mx8-nxp-bsp = "imx-gst1.0-plugin"
#PREFERRED_VERSION_gstreamer1.0:mx8-nxp-bsp = "1.20.3.imx"
#PREFERRED_VERSION_gstreamer1.0-plugins-base:mx8-nxp-bsp = "1.20.3.imx"
#PREFERRED_VERSION_gstreamer1.0-plugins-good:mx8-nxp-bsp = "1.20.3.imx"
#PREFERRED_VERSION_gstreamer1.0-plugins-bad:mx8-nxp-bsp = "1.20.3.imx"

# Add VPU and Cortex M4/M7 firmware
MACHINE_FIRMWARE:append:mx8-nxp-bsp = " \
        firmware-imx-vpu-imx8 \
        "

MACHINE_EXTRA_RDEPENDS += " \
        gptfdisk \
        hostapd \
        hdparm \
        imx-kobs \
        iw \
        kernel-modules \
        kmod \
        ${@bb.utils.contains('DISTRO', 'b2qt', '', \
           bb.utils.contains('DISTRO_FEATURES', 'wayland', 'networkmanager', \
                                                       '', d), d)} \
        packagegroup-tools-bluetooth \
        bluez-alsa \
        pm-utils \
        rng-tools \
        wpa-supplicant \
        wireless-regdb-static \
        u-boot-fw-utils \
	u-boot-splash \
"

# Packages added to all images (including core-image-minimal)
IMAGE_INSTALL:append:mx8-nxp-bsp = " \
	kernel-image \
	kernel-devicetree \
"

IMAGE_FSTYPES = "tar.gz wic.gz"

# Wayland based distros add systemd to DISTRO_FEATURES
# Remove sysvinit or systemd based on DISTRO_FEATURES to avoid conflicts
DISTRO_FEATURES_BACKFILL_CONSIDERED:append = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' sysvinit', '', d)}"
DISTRO_FEATURES_BACKFILL_CONSIDERED:append = "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', ' systemd', '', d)}"

# Use bluez-alsa instead of pulseaudio
DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " pulseaudio"
