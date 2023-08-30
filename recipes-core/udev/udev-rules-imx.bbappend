FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append_imx8mq-trux-q01 = " file://usb-power.rules"
SRC_URI:append_imx8mm-trux-q01 = " file://usb-power.rules"

do_install:append_imx8mq-trux-q01 () {
        install -d ${D}${sysconfdir}/udev/rules.d
        install -m 0644 ${WORKDIR}/usb-power.rules ${D}${sysconfdir}/udev/rules.d/
}

do_install:append_imx8mm-trux-q01 () {
        install -d ${D}${sysconfdir}/udev/rules.d
        install -m 0644 ${WORKDIR}/usb-power.rules ${D}${sysconfdir}/udev/rules.d/
}


