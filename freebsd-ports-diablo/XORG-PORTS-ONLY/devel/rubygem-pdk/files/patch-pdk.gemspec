--- pdk.gemspec.orig
+++ pdk.gemspec
@@ -25,54 +25,54 @@
     if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
       s.add_runtime_dependency(%q<bundler>.freeze, [">= 1.15.0", "< 3.0.0"])
       s.add_runtime_dependency(%q<cri>.freeze, [">= 2.10.1", "< 2.16.0"])
-      s.add_runtime_dependency(%q<childprocess>.freeze, ["~> 0.7.1"])
+      s.add_runtime_dependency(%q<childprocess>.freeze, [">= 0.7.1"])
       s.add_runtime_dependency(%q<gettext-setup>.freeze, ["~> 0.24"])
-      s.add_runtime_dependency(%q<tty-spinner>.freeze, ["= 0.5.0"])
-      s.add_runtime_dependency(%q<tty-prompt>.freeze, ["= 0.13.1"])
+      s.add_runtime_dependency(%q<tty-spinner>.freeze, [">= 0.5.0"])
+      s.add_runtime_dependency(%q<tty-prompt>.freeze, [">= 0.13.1"])
       s.add_runtime_dependency(%q<json_pure>.freeze, ["~> 2.1.0"])
-      s.add_runtime_dependency(%q<json-schema>.freeze, ["= 2.8.0"])
-      s.add_runtime_dependency(%q<tty-which>.freeze, ["= 0.3.0"])
+      s.add_runtime_dependency(%q<json-schema>.freeze, [">= 2.8.0"])
+      s.add_runtime_dependency(%q<tty-which>.freeze, [">= 0.3.0"])
       s.add_runtime_dependency(%q<diff-lcs>.freeze, ["= 1.3"])
-      s.add_runtime_dependency(%q<minitar>.freeze, ["~> 0.6.1"])
+      s.add_runtime_dependency(%q<minitar>.freeze, [">= 0.6.1"])
       s.add_runtime_dependency(%q<pathspec>.freeze, ["~> 0.2.1"])
-      s.add_runtime_dependency(%q<ffi>.freeze, ["~> 1.9.0"])
-      s.add_runtime_dependency(%q<hitimes>.freeze, ["= 1.3.0"])
-      s.add_runtime_dependency(%q<net-ssh>.freeze, ["~> 4.2.0"])
+      s.add_runtime_dependency(%q<ffi>.freeze, [">= 1.9.0"])
+      s.add_runtime_dependency(%q<hitimes>.freeze, [">= 1.3.0"])
+      s.add_runtime_dependency(%q<net-ssh>.freeze, [">= 4.2.0"])
       s.add_runtime_dependency(%q<deep_merge>.freeze, ["~> 1.1"])
     else
       s.add_dependency(%q<bundler>.freeze, [">= 1.15.0", "< 3.0.0"])
       s.add_dependency(%q<cri>.freeze, [">= 2.10.1", "< 2.16.0"])
-      s.add_dependency(%q<childprocess>.freeze, ["~> 0.7.1"])
+      s.add_dependency(%q<childprocess>.freeze, [">= 0.7.1"])
       s.add_dependency(%q<gettext-setup>.freeze, ["~> 0.24"])
-      s.add_dependency(%q<tty-spinner>.freeze, ["= 0.5.0"])
-      s.add_dependency(%q<tty-prompt>.freeze, ["= 0.13.1"])
+      s.add_dependency(%q<tty-spinner>.freeze, [">= 0.5.0"])
+      s.add_dependency(%q<tty-prompt>.freeze, [">= 0.13.1"])
       s.add_dependency(%q<json_pure>.freeze, ["~> 2.1.0"])
-      s.add_dependency(%q<json-schema>.freeze, ["= 2.8.0"])
-      s.add_dependency(%q<tty-which>.freeze, ["= 0.3.0"])
+      s.add_dependency(%q<json-schema>.freeze, [">= 2.8.0"])
+      s.add_dependency(%q<tty-which>.freeze, [">= 0.3.0"])
       s.add_dependency(%q<diff-lcs>.freeze, ["= 1.3"])
-      s.add_dependency(%q<minitar>.freeze, ["~> 0.6.1"])
+      s.add_dependency(%q<minitar>.freeze, [">= 0.6.1"])
       s.add_dependency(%q<pathspec>.freeze, ["~> 0.2.1"])
-      s.add_dependency(%q<ffi>.freeze, ["~> 1.9.0"])
-      s.add_dependency(%q<hitimes>.freeze, ["= 1.3.0"])
-      s.add_dependency(%q<net-ssh>.freeze, ["~> 4.2.0"])
+      s.add_dependency(%q<ffi>.freeze, [">= 1.9.0"])
+      s.add_dependency(%q<hitimes>.freeze, [">= 1.3.0"])
+      s.add_dependency(%q<net-ssh>.freeze, [">= 4.2.0"])
       s.add_dependency(%q<deep_merge>.freeze, ["~> 1.1"])
     end
   else
     s.add_dependency(%q<bundler>.freeze, [">= 1.15.0", "< 3.0.0"])
     s.add_dependency(%q<cri>.freeze, [">= 2.10.1", "< 2.16.0"])
-    s.add_dependency(%q<childprocess>.freeze, ["~> 0.7.1"])
+    s.add_dependency(%q<childprocess>.freeze, [">= 0.7.1"])
     s.add_dependency(%q<gettext-setup>.freeze, ["~> 0.24"])
-    s.add_dependency(%q<tty-spinner>.freeze, ["= 0.5.0"])
-    s.add_dependency(%q<tty-prompt>.freeze, ["= 0.13.1"])
+    s.add_dependency(%q<tty-spinner>.freeze, [">= 0.5.0"])
+    s.add_dependency(%q<tty-prompt>.freeze, [">= 0.13.1"])
     s.add_dependency(%q<json_pure>.freeze, ["~> 2.1.0"])
-    s.add_dependency(%q<json-schema>.freeze, ["= 2.8.0"])
-    s.add_dependency(%q<tty-which>.freeze, ["= 0.3.0"])
+    s.add_dependency(%q<json-schema>.freeze, [">= 2.8.0"])
+    s.add_dependency(%q<tty-which>.freeze, [">= 0.3.0"])
     s.add_dependency(%q<diff-lcs>.freeze, ["= 1.3"])
-    s.add_dependency(%q<minitar>.freeze, ["~> 0.6.1"])
+    s.add_dependency(%q<minitar>.freeze, [">= 0.6.1"])
     s.add_dependency(%q<pathspec>.freeze, ["~> 0.2.1"])
-    s.add_dependency(%q<ffi>.freeze, ["~> 1.9.0"])
-    s.add_dependency(%q<hitimes>.freeze, ["= 1.3.0"])
-    s.add_dependency(%q<net-ssh>.freeze, ["~> 4.2.0"])
+    s.add_dependency(%q<ffi>.freeze, [">= 1.9.0"])
+    s.add_dependency(%q<hitimes>.freeze, [">= 1.3.0"])
+    s.add_dependency(%q<net-ssh>.freeze, [">= 4.2.0"])
     s.add_dependency(%q<deep_merge>.freeze, ["~> 1.1"])
   end
 end