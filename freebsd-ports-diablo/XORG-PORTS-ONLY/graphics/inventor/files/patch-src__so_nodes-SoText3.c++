--- lib/database/src/so/nodes/SoText3.c++.orig	2018-11-05 17:54:33 UTC
+++ lib/database/src/so/nodes/SoText3.c++
@@ -1473,7 +1473,7 @@ SoOutlineFontCache::createUniFontList(co
     fontNums = new SbPList; 
       
     while (s1 = (char *)strchr(s, ';')) {
-       *s1 = (char)NULL;  /* font name is pointed to s */
+       *s1 = 0;  /* font name is pointed to s */
 
        if ((fn = flCreateFont((const GLubyte*)s, mat, 0, NULL)) == (FLfontNumber)0) {
 #ifdef DEBUG
