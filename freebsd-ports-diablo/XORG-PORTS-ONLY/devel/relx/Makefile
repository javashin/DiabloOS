# $FreeBSD$

PORTNAME=	relx
PORTVERSION=	3.32.0
DISTVERSIONPREFIX=	v
CATEGORIES=	devel
MASTER_SITES+=	LOCAL/olgeni:deps \
		http://olgeni.olgeni.com/~olgeni/distfiles/:deps \
		https://repo.hex.pm/tarballs/:hex
DISTFILES=	relx-cache-${PORTVERSION}${EXTRACT_SUFX}:deps
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX} \
		relx-cache-${PORTVERSION}${EXTRACT_SUFX}

MAINTAINER=	olgeni@FreeBSD.org
COMMENT=	Sane, simple release creation for Erlang

LICENSE=	APACHE20

BUILD_DEPENDS=	${LOCALBASE}/bin/erl:lang/erlang \
		rebar3>=0:devel/rebar3
RUN_DEPENDS:=	${BUILD_DEPENDS}

OPTIONS_DEFINE=	DOCS EXAMPLES

PLIST_SUB=	VERSION="${PORTVERSION}"

# Use either erlware or tsloughter, depending on who actually
# published the package on hex.pm
USE_GITHUB=	yes
GH_ACCOUNT=	erlware

# from rebar.lock
REBAR_DEPS=	bbmustache-1.8.0 \
		cf-0.3.1 \
		erlware_commons-1.3.1 \
		getopt-1.0.1 \
		providers-1.7.0

.for _dep in ${REBAR_DEPS}
DISTFILES+=	${_dep}.tar:hex
.endfor

# convenience target to rebuild the relx cache file
build-cache:
	cd ${WRKDIR} && ${TAR} -c -v -z -f relx-cache-${PORTVERSION}${EXTRACT_SUFX} .cache

# rebar3 insists on downloading dependencies, and some kind of package
# index into the user's HOME. We need to trick it into behaving by
# providing both before building.

post-extract:
	@${REINPLACE_CMD} -e 's/{ *vsn,.*}/{vsn, "${PORTVERSION}"}/' ${WRKSRC}/src/*.app.src
.for _dep in ${REBAR_DEPS}
	${MKDIR} ${WRKSRC}/_build/default/lib/${_dep:C/-.*//}
	${TAR} xOf ${DISTDIR}/${_dep}.tar contents.tar.gz |\
		${TAR} xfz - -C ${WRKSRC}/_build/default/lib/${_dep:C/-.*//}
.endfor

do-build:
	@${RM} ${WRKSRC}/rebar.lock
	@cd ${WRKSRC} && HOME=${WRKDIR} rebar3 compile
	@${RM} ${WRKSRC}/rebar.lock
	@cd ${WRKSRC} && HOME=${WRKDIR} rebar3 escriptize

post-build:
	@${LN} -s ${WRKSRC}/_build/dev/lib/${PORTNAME}/ebin ${WRKSRC}

do-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/lib/erlang/lib/${PORTNAME}-${PORTVERSION}
	@${MKDIR} ${STAGEDIR}${PREFIX}/lib/erlang/lib/${PORTNAME}-${PORTVERSION}/ebin
	@${MKDIR} ${STAGEDIR}${PREFIX}/lib/erlang/lib/${PORTNAME}-${PORTVERSION}/include
	@${MKDIR} ${STAGEDIR}${PREFIX}/lib/erlang/lib/${PORTNAME}-${PORTVERSION}/priv
	@${MKDIR} ${STAGEDIR}${PREFIX}/lib/erlang/lib/${PORTNAME}-${PORTVERSION}/src
	${INSTALL_DATA} ${WRKSRC}/include/* ${STAGEDIR}${PREFIX}/lib/erlang/lib/${PORTNAME}-${PORTVERSION}/include
	${INSTALL_DATA} ${WRKSRC}/src/* ${STAGEDIR}${PREFIX}/lib/erlang/lib/${PORTNAME}-${PORTVERSION}/src
	${INSTALL_DATA} ${WRKSRC}/_build/default/lib/relx/ebin/* ${STAGEDIR}${PREFIX}/lib/erlang/lib/${PORTNAME}-${PORTVERSION}/ebin
	cd ${WRKSRC}/priv && ${COPYTREE_SHARE} \* ${STAGEDIR}${PREFIX}/lib/erlang/lib/${PORTNAME}-${PORTVERSION}/priv
	${INSTALL_SCRIPT} ${WRKSRC}/_build/default/bin/${PORTNAME} ${STAGEDIR}${PREFIX}/bin

post-install-DOCS-on:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.md ${STAGEDIR}${DOCSDIR}

post-install-EXAMPLES-on:
	@${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/examples/* ${STAGEDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
