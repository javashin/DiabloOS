# $FreeBSD$

PORTNAME=	mesa-dev
DISTVERSION=	20.0.0-20191218
CATEGORIES=	graphics

MAINTAINER=	greg@unrelenting.technology
COMMENT=	Development version of the Mesa graphics stack

LICENSE=	MIT

# CONFLICTS_INSTALL=	mesa-dri mesa-libs libosmesa clover
# use dummies with these names

ONLY_FOR_ARCHS=	aarch64 amd64 powerpc64
ONLY_FOR_ARCHS_REASON=	would be funny to port everything to an iBook G4 for the memes but who seriously uses anything other than these for a desktop?

USES=		bison compiler:c++11-lib gettext-tools localbase meson pathfix \
		pkgconfig python:3.6,build shebangfix xorg
USE_LDCONFIG=	yes
USE_XORG=	x11 xcb xdamage xext xfixes xorgproto xshmfence xv xvmc xxf86vm

USE_GITLAB=	yes
GL_SITE=	https://gitlab.freedesktop.org
GL_ACCOUNT=	myfreeweb
GL_PROJECT=	mesa
GL_COMMIT=	c67bce7c40491d5b76f8b81e60fccd681cb2761a

MESA_LLVM_VER?=	90

SHEBANG_FILES=	src/vulkan/overlay-layer/mesa-overlay-control.py

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}mako>0:textproc/py-mako@${PY_FLAVOR} \
		glslangValidator:devel/glslang \
		libclc>=0.3.0:devel/libclc \
		llvm${MESA_LLVM_VER}>=5.0.0:devel/llvm${MESA_LLVM_VER} \
		opencl>=0:devel/opencl \
		wayland-protocols>=1.8:graphics/wayland-protocols \
		xrandr:x11/xrandr

# NOTE: modern libunwind especially needed for aarch64
LIB_DEPENDS=	libdrm.so:graphics/libdrm \
		libexpat.so:textproc/expat2 \
		libOpenCL.so:devel/ocl-icd \
		libunwind.so:devel/libunwind \
		libva.so:multimedia/libva \
		libvdpau.so:multimedia/libvdpau \
		libwayland-server.so:graphics/wayland \
		libzstd.so:archivers/zstd

.include <bsd.port.options.mk>

.if ${OPSYS} == DragonFly
# Does DFly really not have libelf in base?
# (not that this port is tested on DFly lol)
LIB_DEPENDS+=		libelf.so:devel/libelf
.else
# If mesa uses a /usr/local libelf while LLVM uses base libelf,
# RadeonSI/RADV shaders won't compile! And probably other things!
# example error: (data->d_size != shdr->sh_size)
CONFLICTS_BUILD=	elfutils libelf
.endif

BINARY_ALIAS=	python=${PYTHON_CMD}

RUN_DEPENDS=	libclc>=0.3.0:devel/libclc \
		llvm${MESA_LLVM_VER}>=5.0.0:devel/llvm${MESA_LLVM_VER} \
		opencl>=0:devel/opencl \
		xrandr:x11/xrandr

.if ${/usr/bin/ld:L:tA} != /usr/bin/ld.lld
# --build-id isn't supported by old GNU ld.bfd in base
USE_BINUTILS=	yes
LDFLAGS+=	-B${LOCALBASE}/bin
.endif

MESON_ARGS=	--native-file="${WRKSRC}/llvm.ini" \
		-Delf-tls="false" \
		-Dgallium-nine="true" \
		-Dgallium-omx="disabled" \
		-Dgallium-opencl="icd" \
		-Dgallium-va="true" \
		-Dosmesa="gallium" \
		-Dprefer-iris="true" \
		-Dvulkan-overlay-layer="true" \
		-Dzstd="true"

.include <bsd.port.options.mk>

PLIST_SUB+=	VK_ARCH="${ARCH:S/amd64/x86_64/:S/aarch64/arm64/}"

.if ${ARCH} == amd64
MESON_ARGS+=	-Dgallium-drivers=r300,r600,radeonsi,nouveau,virgl,svga,swrast,swr,iris \
		-Dvulkan-drivers=amd,intel
PLIST_SUB+=	INTEL="" \
		IRIS="" \
		LEGACY="" \
		SWR=""
.else
MESON_ARGS+=	-Dgallium-drivers=r300,r600,radeonsi,nouveau,virgl,svga,swrast \
		-Dvulkan-drivers=amd
PLIST_SUB+=	INTEL="@comment " \
		IRIS="@comment " \
		LEGACY="@comment " \
		SWR="@comment "
.endif

pre-configure:
	${PRINTF} "[binaries]\nllvm-config = '${LOCALBASE}/bin/llvm-config${MESA_LLVM_VER}'" \
		> "${WRKSRC}/llvm.ini"

.include <bsd.port.mk>
