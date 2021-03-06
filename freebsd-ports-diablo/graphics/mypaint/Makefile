# Created by: Andrew Pantyukhin <infofarmer@FreeBSD.org>
# $FreeBSD$

PORTNAME=	mypaint
DISTVERSIONPREFIX=v
DISTVERSION=	2.0.0-alpha.13
CATEGORIES=	graphics

PATCH_SITES=	https://github.com/garynthompson/${PORTNAME}/commit/
PATCHFILES=	94c623b788462fadb3e292b918edc4e90adf4faa.patch:-p1

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Fast painting/scribbling program

LICENSE=	GPLv2+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	swig3.0:devel/swig30 \
		mypaint-brushes>0:graphics/mypaint-brushes \
		${PYNUMPY}
LIB_DEPENDS=	libjson-c.so:devel/json-c \
		liblcms2.so:graphics/lcms2 \
		libpng16.so:graphics/png \
		libmypaint-2.0.so:graphics/libmypaint
RUN_DEPENDS=	mypaint-brushes>0:graphics/mypaint-brushes \
		${PYNUMPY}

USES=		compiler:c++11-lib desktop-file-utils gettext gnome localbase \
		pkgconfig python:3.6+ tar:xz

USE_GITHUB=	yes
GH_ACCOUNT=	mypaint

BINARY_ALIAS=	swig=swig3.0
USE_GNOME=	gtk30 pygobject3 cairo librsvg2:run
USE_PYTHON=	distutils py3kplist
CFLAGS+=	${CFLAGS_${CHOSEN_COMPILER_TYPE}}
CFLAGS_gcc=	-std=c99
USE_LDCONFIG=	yes
INSTALLS_ICONS=	yes

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/mypaint/lib/_mypaintlib.so

.include <bsd.port.mk>
