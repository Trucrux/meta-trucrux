DESCRIPTION = "AP6275S Wifi Bt Firmware"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=b97a012949927931feb7793eee5ed924"


SRC_URI += " \
    file://BCM4362A2_001.003.006.1012.1017.hcd \
    file://clm_bcm43752a2_ag.blob \
    file://fw_bcm43752a2_ag.bin \
    file://fw_bcm43752a2_ag_apsta.bin \
    file://nvram_ap6275s.txt \
    file://nvram_ap6275s_m2.txt \
    file://ReadMe.txt \
"
INSANE_SKIP_${PN} += "installed-vs-shipped"

do_install() {
    install -d ${D}${base_libdir}/firmware/bcmdhd
    cp -r ${WORKDIR}/fw_bcm43752a2_ag.bin ${D}${base_libdir}/firmware/bcmdhd
    cp -r ${WORKDIR}/fw_bcm43752a2_ag_apsta.bin ${D}${base_libdir}/firmware/bcmdhd
    cp -r ${WORKDIR}/BCM4362A2_001.003.006.1012.1017.hcd ${D}${base_libdir}/firmware/bcmdhd
    cp -r ${WORKDIR}/clm_bcm43752a2_ag.blob ${D}${base_libdir}/firmware/bcmdhd
    cp -r ${WORKDIR}/nvram_ap6275s.txt ${D}${base_libdir}/firmware/bcmdhd
    cp -r ${WORKDIR}/nvram_ap6275s_m2.txt ${D}${base_libdir}/firmware/bcmdhd
    cp -r ${WORKDIR}/ReadMe.txt ${D}${base_libdir}/firmware/bcmdhd
}

FILES:${PN} += "${base_libdir}/firmware/bcmdhd"
