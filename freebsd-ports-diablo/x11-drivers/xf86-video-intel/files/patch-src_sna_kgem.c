I915_USERPTR_UNSYNCHRONIZED is broken since drm-v4.11
https://github.com/FreeBSDDesktop/kms-drm/issues/32

--- src/sna/kgem.c.orig	2019-02-21 22:26:50 UTC
+++ src/sna/kgem.c
@@ -69,7 +69,7 @@ search_snoop_cache(struct kgem *kgem, unsigned int num
 #define DBG_NO_CPU 0
 #define DBG_NO_CREATE2 0
 #define DBG_NO_USERPTR 0
-#define DBG_NO_UNSYNCHRONIZED_USERPTR 0
+#define DBG_NO_UNSYNCHRONIZED_USERPTR 1
 #define DBG_NO_COHERENT_MMAP_GTT 0
 #define DBG_NO_LLC 0
 #define DBG_NO_SEMAPHORES 0
