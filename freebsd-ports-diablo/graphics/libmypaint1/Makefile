# $FreeBSD$

PORTNAME=	libmypaint
PORTVERSION=	1.3.0
PORTREVISION=	2
CATEGORIES=	graphics
MASTER_SITES=	https://github.com/mypaint/libmypaint/releases/download/v${PORTVERSION}/
PKGNAMESUFFIX=1

MAINTAINER=	kwm@FreeBSD.org
COMMENT=	Brush library from the MyPaint project

LICENSE=	ISCL
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libjson-c.so:devel/json-c

USES=		compiler:c11 gmake gnome libtool localbase pkgconfig tar:xz
USE_GNOME=	glib20 introspection:build
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

TEST_TARGET=	check

OPTIONS_SUB=	yes
OPTIONS_DEFINE=	NLS

NLS_USES=	gettext
NLS_USE=	GNOME=intltool
NLS_CONFIGURE_ENABLE=	nls i18n

.include <bsd.port.mk>
