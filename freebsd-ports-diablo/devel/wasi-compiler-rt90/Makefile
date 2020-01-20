# $FreeBSD$

PORTNAME=	compiler-rt
PKGNAMEPREFIX=	wasi-
PKGNAMESUFFIX=	${LLVM_SUFFIX}
DISTVERSION=	9.0.0
CATEGORIES=	devel lang
.if ${DISTVERSION:M*rc*}
MASTER_SITES=	https://prereleases.llvm.org/${LLVM_RELEASE}/${RCDIR}
.else
MASTER_SITES=	https://releases.llvm.org/${LLVM_RELEASE}/
.endif
PKGNAMESUFFIX=	${LLVM_SUFFIX}
DISTNAME=	${PORTNAME}-${DISTVERSION}.src
DISTFILES=	${PORTNAME}-${DISTVERSION}.src${EXTRACT_SUFX}

MAINTAINER=	greg@unrelenting.technology
COMMENT=	Clang builtins library for WASI

LICENSE+=	LLVM2
LICENSE_FILE=	${WRKSRC}/LICENSE.TXT
LICENSE_NAME=	Apache License 2.0 with LLVM Exceptions
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

LLVM_RELEASE=	${DISTVERSION:C/rc.*//}
LLVM_SUFFIX=	${LLVM_RELEASE:C/\.[0-9]$//:C/\.//}
LLVM_PREFIX=	${PREFIX}/llvm${LLVM_SUFFIX}

WASI_SYSROOT=	${LOCALBASE}/share/wasi-sysroot

BUILD_DEPENDS=	${WASI_SYSROOT}/include/stdarg.h:devel/wasi-libc \
		clang${LLVM_VERSION}:devel/llvm${LLVM_VERSION}

USES=		cmake compiler:c++11-lib tar:xz

PLIST_FILES=	llvm${LLVM_SUFFIX}/lib/clang/${LLVM_RELEASE}/lib/wasi/libclang_rt.builtins-wasm32.a

CC=		${LOCALBASE}/bin/clang${LLVM_SUFFIX}
CXX=		${LOCALBASE}/bin/clang++${LLVM_SUFFIX}

CMAKE_SOURCE_PATH=	${WRKSRC}/lib/builtins
CMAKE_INSTALL_PREFIX=	${LLVM_PREFIX}
CMAKE_ARGS=	-DCMAKE_C_COMPILER_WORKS=1 \
		-DCMAKE_SYSROOT=${WASI_SYSROOT} \
		-DCOMPILER_RT_BAREMETAL_BUILD=TRUE \
		-DCOMPILER_RT_DEFAULT_TARGET_TRIPLE=wasm32-wasi \
		-DCOMPILER_RT_EXCLUDE_ATOMIC_BUILTIN=TRUE \
		-DLLVM_CONFIG_PATH=${LOCALBASE}/bin/llvm-config${LLVM_SUFFIX}

post-build:
	${LOCALBASE}/bin/llvm-ranlib${LLVM_SUFFIX} ${CONFIGURE_WRKSRC}/lib/freebsd/*.a

post-install:
	${MKDIR} ${STAGEDIR}${LLVM_PREFIX}/lib/clang/${LLVM_RELEASE}/lib/wasi
	${MV} ${STAGEDIR}${LLVM_PREFIX}/lib/freebsd/* \
		${STAGEDIR}${LLVM_PREFIX}/lib/clang/${LLVM_RELEASE}/lib/wasi

.include <bsd.port.mk>
