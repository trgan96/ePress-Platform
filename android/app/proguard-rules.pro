# Keep all Flutter classes
-keep class io.flutter.** { *; }
-keep class androidx.** { *; }

# Keep localization classes
-keep class * extends flutter.** { *; }
-keep class * extends io.flutter.embedding.** { *; }
-keep class * extends io.flutter.plugins.** { *; }
-keep class * extends io.flutter.view.** { *; }

# Keep classes related to internationalization
-keep class * extends dart.** { *; }
-keep class * extends com.google.gson.** { *; }
-keep class * extends com.google.common.** { *; }
-keep class * extends org.json.** { *; }

# Keep classes related to localization and intl package
-keep class * extends androidx.lifecycle.** { *; }
-keep class * extends com.appvity.ptth.** { *; }
-keep class * extends dev.flutter.plugins.** { *; }

# Keep all localization-related generated classes
-keep class com.appvity.ptth.** { *; }

-keep class com.example.myreflection.** { *; }

# Keep all classes that implement Serializable
-keep class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

# Keep all classes that implement Parcelable
-keep class * implements android.os.Parcelable {
  public static final android.os.Parcelable$Creator *;
}