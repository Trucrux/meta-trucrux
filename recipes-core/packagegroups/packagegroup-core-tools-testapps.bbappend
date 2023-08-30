#CONNMAN_PACKAGES = "\
#    connman-tools \
#    connman-tests \
#    connman-client \
#    "

#RDEPENDS_${PN}:remove = "\
#    ${@bb.utils.contains('DISTRO', 'b2qt', '', \
#       bb.utils.contains('DISTRO_FEATURES', 'wayland', '${CONNMAN_PACKAGES}', \
#                                                   '', d), d)} \
#    "
#

RDEPENDS:${PN} = "\
    blktool \
    ${KEXECTOOLS} \
    alsa-utils-amixer \
    alsa-utils-aplay \
    ltp \
    ${NETWORK_MANAGER} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', "${X11TOOLS}", "", d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', "${X11GLTOOLS}", "", d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', '3g', "${3GTOOLS}", "", d)} \
    ${GOTOOLS} \
    ${RUSTTOOLS} \
    "
