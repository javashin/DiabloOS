--- chrome/browser/ui/libgtkui/print_dialog_gtk.cc.orig	2019-10-21 19:06:24 UTC
+++ chrome/browser/ui/libgtkui/print_dialog_gtk.cc
@@ -336,6 +336,7 @@ void PrintDialogGtk::ShowDialog(
   // Since we only generate PDF, only show printers that support PDF.
   // TODO(thestig) Add more capabilities to support?
   GtkPrintCapabilities cap = static_cast<GtkPrintCapabilities>(
+      GTK_PRINT_CAPABILITY_GENERATE_PS |
       GTK_PRINT_CAPABILITY_GENERATE_PDF |
       GTK_PRINT_CAPABILITY_PAGE_SET |
       GTK_PRINT_CAPABILITY_COPIES |
