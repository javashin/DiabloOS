# Created by: Matthias Petermann <matthias@petermann-it.de>
# $FreeBSD$

PORTNAME=	trytond28_product
PORTVERSION=	2.8.2
PORTREVISION=	2
CATEGORIES=	finance python
MASTER_SITES=	CHEESESHOP \
		http://downloads-cdn.tryton.org/${PORTVERSION:R}/
DISTNAME=	trytond_product-${PORTVERSION}

MAINTAINER=	matthias@petermann-it.de
COMMENT=	Tryton Application Platform (Product Module)

DEPRECATED=	Outdated, uses EOLed python27
EXPIRATION_DATE=	2020-02-03

LICENSE=	GPLv3

RUN_DEPENDS=	trytond28>=2.8.2:finance/trytond28

CONFLICTS=	trytond_product-2.[46].*

USES=		python:2.7
USE_PYTHON=	distutils autoplist

.include <bsd.port.mk>
