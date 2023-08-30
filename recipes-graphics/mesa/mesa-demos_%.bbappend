FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append_imxgpu3d = " file://do-not-build-xeglgears.patch"
