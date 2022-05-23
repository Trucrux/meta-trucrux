FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
	file://remove_default_sleep_d.diff \
        file://01-bt.sh \
        file://02-wifi.sh \
"

SRC_URI_append_imx8mm-trux-q01 = " \
	file://03-eth.sh \
"

FILES_${PN} += "${sysconfdir}/pm/sleep.d/*"

do_install_append_imx8mm-trux-q01() {
        install -d ${D}/${sysconfdir}/pm/sleep.d
        install -m 0755 ${WORKDIR}/03-eth.sh ${D}/${sysconfdir}/pm/sleep.d
}
