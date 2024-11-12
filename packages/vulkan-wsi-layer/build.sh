TERMUX_PKG_HOMEPAGE=https://github.com/KhronosGroup/Vulkan-ExtensionLayer
TERMUX_PKG_DESCRIPTION="Vulkan Tools and Utilities"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="xMeM <haooy@outlook.com>"
_COMMIT=d5624d42d8b2debbd910ad25662a05c751eb38b7
TERMUX_PKG_VERSION="0.0.1-r162.${_COMMIT:0:7}"
TERMUX_PKG_SRCURL=git+https://github.com/xMeM/vulkan-wsi-layer
TERMUX_PKG_SHA256="0027e0f45d302ab32f4712ef125cea3c2b955e953fa7711d9aacfef19a5c93b1"
TERMUX_PKG_GIT_BRANCH=main
TERMUX_PKG_DEPENDS="libc++"
TERMUX_PKG_BUILD_DEPENDS="vulkan-headers, vulkan-loader-generic"
TERMUX_PKG_RECOMMENDS="vulkan-loader-generic"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DVULKAN_HEADERS_INSTALL_DIR=$TERMUX_PREFIX
"

termux_step_post_get_source() {
	git fetch --unshallow
	git checkout $_COMMIT

	local version="$(printf "0.0.1-r%d.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")"
	if [ "$version" != "$TERMUX_PKG_VERSION" ]; then
		echo -n "ERROR: The specified version \"$TERMUX_PKG_VERSION\""
		echo " is different from what is expected to be: \"$version\""
		return 1
	fi

	local s=$(find . -type f ! -path '*/.git/*' -print0 | xargs -0 sha256sum | LC_ALL=C sort | sha256sum)
	echo "$s"
	if [[ "${s}" != "${TERMUX_PKG_SHA256}  "* ]]; then
		termux_error_exit "Checksum mismatch for source files."
	fi
}
