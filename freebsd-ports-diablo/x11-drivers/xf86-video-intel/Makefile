# Created by: lesi@FreeBSD.org
# $FreeBSD: head/x11-drivers/xf86-video-intel/Makefile 516607 2019-11-03 21:56:37Z zeising $

PORTNAME=	xf86-video-intel
DISTVERSION=	2.99.917-896
DISTVERSIONSUFFIX=	-g${GL_COMMIT:C/(.{12}).*/\1/}
PORTEPOCH=	1
CATEGORIES=	x11-drivers

MAINTAINER=	x11@FreeBSD.org
COMMENT=	X.Org legacy driver for Intel integrated graphics chipsets

LICENSE=	MIT	# various
LICENSE_FILE=	${WRKSRC}/COPYING

ONLY_FOR_ARCHS=	amd64 i386
ONLY_FOR_ARCHS_REASON=	Only Intel integrated GPUs on x86 are supported

LIB_DEPENDS=	libxcb-util.so:x11/xcb-util \
		libdrm.so:graphics/libdrm

USES=		cpe gl localbase xorg xorg-cat:driver
CPE_VENDOR=	x
USE_GITLAB=	yes
GL_COMMIT=	e628d22673dfa494230e6f79ceff7d178137c71a
USE_GL=		gl
USE_XORG=	pciaccess pixman x11 xcb xext xrender xv xvmc
USE_LDCONFIG=	yes
CONFIGURE_ENV=	ac_cv_header_sys_sysinfo_h=no # XXX ports/242236
CONFIGURE_ARGS=	--with-builderstring="${DISTVERSIONFULL}"
TEST_TARGET=	check

# XXX bug 214593: SNA crashes on pre-SandyBridge hardware
CONFIGURE_ARGS+=--with-default-accel=uxa
# XXX Remove after FreeBSD 11 EOL
CPPFLAGS+=	-D_WITH_GETLINE

OPTIONS_DEFINE=	UDEV
OPTIONS_DEFAULT=UDEV

UDEV_DESC=		udev-based monitor hotplug detection
UDEV_LIB_DEPENDS=	libudev.so:devel/libudev-devd
UDEV_CONFIGURE_ENABLE=	udev

post-patch:
.if ${CONFIGURE_ARGS:M--with-default-accel=uxa}
	@${REINPLACE_CMD} '/^Default/s/SNA/UXA/' ${WRKSRC}/man/intel.man
.endif

.include <bsd.port.mk>
