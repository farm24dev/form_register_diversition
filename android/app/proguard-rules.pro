# Baseline ProGuard / R8 rules for Flutter
# Keep Flutter engine & plugin classes
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Keep Application and Activity classes
-keep class com.example.form_register_diversition.** { *; }

# (Adjust if you add Firebase/other SDKs) Examples:
# -keep class com.google.firebase.** { *; }
# -keep class com.google.android.gms.** { *; }

# If using JSON serialization with reflection (rare in Flutter):
# -keep class **$$JsonAdapter { *; }
# -keep class **JsonAdapter { *; }

# Prevent warnings for missing classes (example placeholders)
# -dontwarn org.apache.http.**
# -dontwarn javax.annotation.**

# Optimization tweaks (optional; R8 already optimizes)
# -dontoptimize
# -dontpreverify

# Keep enum methods sometimes stripped
-keepclassmembers enum * { public static **[] values(); public static ** valueOf(java.lang.String); }

# If using WorkManager or Lifecycle libs (add as needed)
# -keep class androidx.lifecycle.** { *; }
# -keep class androidx.work.** { *; }

# End of file
