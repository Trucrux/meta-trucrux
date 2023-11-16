#
# Modified Startup script and systemd unit file for the Weston Wayland compositor
#
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

RDEPENDS:${PN}:append = " adwaita-icon-theme adwaita-icon-theme-cursors"

SRC_URI += " file://trux-weston@.service \
             file://setup-weston-init.sh \
             file://weston.ini"

S = "${WORKDIR}"

inherit systemd
SYSTEMD_AUTO_ENABLE = "enable"
SYSTEMD_SERVICE:${PN} = "weston.service"

update_file() {
    if ! grep -q "$1" $3; then
        bbfatal $1 not found in $3
    fi
    sed -i -e "s,$1,$2," $3
}

do_install:append() {
	# Overwrite modified Weston systemd service
	install -D -p -m0644 ${WORKDIR}/trux-weston@.service ${D}${systemd_system_unitdir}/weston@.service
	sed -i -e s:/etc:${sysconfdir}:g \
		-e s:/usr/bin:${bindir}:g \
		-e s:/var:${localstatedir}:g \
		${D}${systemd_unitdir}/system/weston@.service
	install -D -p -m0755 ${WORKDIR}/setup-weston-init.sh ${D}${bindir}

	install -d ${D}${sysconfdir}/xdg/weston
	cp ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/

	# Add weston.log back, used by NXP for testing
	update_file "ExecStart=/usr/bin/weston " "ExecStart=/usr/bin/weston --log=\$\{XDG_RUNTIME_DIR\}/weston.log " ${D}${systemd_system_unitdir}/weston.service

	# FIXME: weston should be run as browser, not as root
	update_file "User=weston" "User=root" ${D}${systemd_system_unitdir}/weston.service
	update_file "Group=weston" "Group=root" ${D}${systemd_system_unitdir}/weston.service

	update_file "WantedBy=" "WantedBy=multi-user.target " ${D}${systemd_system_unitdir}/weston.service

	if ! grep -q "ExecStartPre=/usr/bin/setup-weston-init.sh" ${D}${systemd_system_unitdir}/weston.service; then
		sed -i '37 i ExecStartPre=/usr/bin/setup-weston-init.sh' ${D}${systemd_system_unitdir}/weston.service
	fi

}

INI_SHELL_SECT = "\\[shell\\]"
INI_SHELL_SECT_mx8mq = ""

INI_UNCOMMENT_ASSIGNMENTS:append_rescue = " \
	${INI_SHELL_SECT} \
	panel-position \
	background-color \
"

FILES_${PN} += "${bindir}/setup-weston-init.sh"
