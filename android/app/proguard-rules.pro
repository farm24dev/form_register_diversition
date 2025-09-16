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

# --- Added for common Dart/Flutter dependencies ---
# flutter_bloc/equatable/intl use no runtime Java reflection; normally safe. Suppress any stray warns.
-dontwarn org.intellij.lang.annotations.*
-dontwarn kotlin.**
-dontwarn kotlinx.**
# Keep Kotlin metadata (useful for reflection / stack traces)
-keep class kotlin.Metadata { *; }

# Coroutines (if transitively pulled in): keep debug probes if referenced
-dontwarn kotlinx.coroutines.debug.internal.*

# If you later add json_serializable (code-gen) you usually do NOT need keeps.
# If you add libraries that use reflection (e.g., Firebase ML, Retrofit), add targeted -keep rules then.

# If using WorkManager or Lifecycle libs (add as needed)
# -keep class androidx.lifecycle.** { *; }
# -keep class androidx.work.** { *; }

# End of file

# --- Suppress warnings for Play Core SplitInstall classes (not used; Flutter deferred components references) ---
-dontwarn com.google.android.play.core.splitcompat.SplitCompatApplication
-dontwarn com.google.android.play.core.splitinstall.SplitInstallException
-dontwarn com.google.android.play.core.splitinstall.SplitInstallManager
-dontwarn com.google.android.play.core.splitinstall.SplitInstallManagerFactory
-dontwarn com.google.android.play.core.splitinstall.SplitInstallRequest$Builder
-dontwarn com.google.android.play.core.splitinstall.SplitInstallRequest
-dontwarn com.google.android.play.core.splitinstall.SplitInstallSessionState
-dontwarn com.google.android.play.core.splitinstall.SplitInstallStateUpdatedListener
-dontwarn com.google.android.play.core.tasks.OnFailureListener
-dontwarn com.google.android.play.core.tasks.OnSuccessListener
-dontwarn com.google.android.play.core.tasks.Task

