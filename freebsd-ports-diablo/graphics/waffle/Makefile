# Created by: Jean-Sébastien Pédron <dumbbell@FreeBSD.org>
# $FreeBSD$

PORTNAME=	waffle
DISTVERSION=	1.6.0-7
DISTVERSIONPREFIX=	v
CATEGORIES=	graphics

# Wayland xdg-shell support (to run on sway/wayfire/etc. that have removed wl-shell)
PATCH_SITES=	https://gitlab.freedesktop.org/oreaus/${PORTNAME}/commit/
PATCHFILES=	3cdce7b38cbd91cd7288e21940b279bf7ddc5757.patch:-p1

MAINTAINER=	x11@FreeBSD.org
COMMENT=	Library that allows to defer selection of an OpenGL API until runtime

LICENSE=	BSD2CLAUSE

USE_GITLAB=	yes
GL_SITE=	https://gitlab.freedesktop.org
GL_ACCOUNT=	mesa
GL_COMMIT=	b71cfa674db5828a2be04a42ce9996d6677629ee

USES=		compiler:c11 gl localbase meson pkgconfig tar:xz
USE_GL=		egl gl
USE_LDCONFIG=	yes

DOCSDIR=	${PREFIX}/share/doc/waffle1

OPTIONS_DEFINE=		DOCS GBM MANPAGES SURFACELESS WAYLAND X11
OPTIONS_DEFAULT=	GBM MANPAGES SURFACELESS WAYLAND X11

MANPAGES_MESON_TRUE=	build-manpages

GBM_DESC=		GBM/DRM/KMS direct-on-hardware support
GBM_MESON_ENABLED=	gbm
GBM_USE=		GL=gbm
GBM_LIB_DEPENDS=	libudev.so:devel/libudev-devd

SURFACELESS_DESC=		Surfaceless EGL support
SURFACELESS_MESON_ENABLED=	surfaceless_egl

WAYLAND_LIB_DEPENDS=	libwayland-egl.so:graphics/wayland
WAYLAND_BUILD_DEPENDS=	wayland-scanner:graphics/wayland
WAYLAND_MESON_ENABLED=	wayland

X11_MESON_ENABLED=	glx x11_egl
X11_USES=		xorg
X11_USE=		XORG=x11,xcb

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MMANPAGES}
BUILD_DEPENDS=	${LOCALBASE}/share/xsl/docbook/manpages/docbook.xsl:textproc/docbook-xsl
USES+=		gnome
USE_GNOME+=	libxslt:build
PLIST_SUB+=	MANPAGES=""
.else
PLIST_SUB+=	MANPAGES="@comment "
.endif

.include <bsd.port.mk>
