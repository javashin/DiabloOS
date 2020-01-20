# $FreeBSD$

PORTNAME=	wasi-libc
DISTVERSION=	g20191221
CATEGORIES=	devel

MAINTAINER=	greg@unrelenting.technology
COMMENT=	WASI libc implementation for WebAssembly

LICENSE=	BSD2CLAUSE CC0-1.0 MIT
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	clang${LLVM_VERSION}:devel/llvm${LLVM_VERSION}

USES=		gmake
USE_GITHUB=	yes
GH_ACCOUNT=	CraneStation
GH_TAGNAME=	a280fead2ae71b9a230d3b48c1f95867431888e4
GH_TUPLE=	WebAssembly:WASI:8ff4e84:wasi/tools/wasi-headers/WASI

NO_ARCH=	yes
LLVM_VERSION?=	90

ALL_TARGET=	finish

# NOTE: matches the https://github.com/CraneStation/wasi-sdk
WASI_SYSROOT= ${PREFIX}/share/wasi-sysroot

# NOTE: our llvm ports don't ship stdarg/stddef clang headers, so they're in FILESDIR
#       and we install them to the sysroot

MAKE_ENV=	INSTALL_DIR=${STAGEDIR}${WASI_SYSROOT} \
		WASM_AR=${LOCALBASE}/bin/llvm-ar${LLVM_VERSION} \
		WASM_CC=${LOCALBASE}/bin/clang${LLVM_VERSION} \
		WASM_CFLAGS="-O2 -DNDEBUG -I${FILESDIR}" \
		WASM_NM=${LOCALBASE}/bin/llvm-nm${LLVM_VERSION}

# NOTE: phony targets cause make install to rebuild everything
#       https://github.com/CraneStation/wasi-libc/issues/156
post-patch:
	${REINPLACE_CMD} -e 's|install: finish|install:|' ${WRKSRC}/Makefile

post-install:
	${INSTALL_DATA} ${FILESDIR}/stdarg.h ${STAGEDIR}${WASI_SYSROOT}/include/
	${INSTALL_DATA} ${FILESDIR}/stddef.h ${STAGEDIR}${WASI_SYSROOT}/include/

.include <bsd.port.mk>
