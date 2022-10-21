# add more qml packages
IMAGE_INSTALL += " \
	qtcharts-qmldesigner \
	qtcharts-qmlplugins \
	qtquickcontrols-qmldesigner \
	qtquickcontrols-qmlplugins \
	qtquickcontrols2-qmldesigner \
	qtquickcontrols2-qmlplugins \
	qtvirtualkeyboard-plugins \
	qtvirtualkeyboard-qmlplugins \
	qtdeclarative-tools \
"

IMAGE_INSTALL_append = " qttools qttools-dev qttools-tools packagegroup-qt5-toolchain-target qtbase-dev qtbase-mkspecs qtbase-tools "
