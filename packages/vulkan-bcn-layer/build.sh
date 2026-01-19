TERMUX_PKG_HOMEPAGE=https://github.com/Pipetto-crypto/bcn_layer
TERMUX_PKG_DESCRIPTION="Vulkan BCn Emulation Layer"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@Pipetto-crypto"
TERMUX_PKG_VERSION="1.0"
TERMUX_PKG_SRCURL=git+https://github.com/Pipetto-crypto/bcn_layer.git
TERMUX_PKG_GIT_BRANCH="main"
TERMUX_PKG_SHA256=SKIP_CHECKSUM
TERMUX_PKG_DEPENDS="libc++, vulkan-loader"
TERMUX_PKG_BUILD_DEPENDS="libwayland, libx11, libxcb, libxrandr, vulkan-headers, vulkan-utility-libraries"
TERMUX_PKG_ANTI_BUILD_DEPENDS="vulkan-loader"

termux_step_configure() {
	return;
}
