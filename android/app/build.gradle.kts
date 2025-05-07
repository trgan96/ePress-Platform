plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    signingConfigs {
        getByName("debug") {
            storeFile = file("D:\\appvity\\PTTH1\\ptth\\keystore\\debug.jks")
            keyAlias = "debug"
            storePassword = "appvity2012"
            keyPassword = "appvity2012"
        }
        create("release") {
            storeFile = file("D:\\appvity\\PTTH1\\ptth\\keystore\\release.jks")
            keyAlias = "release"
            storePassword = "appvity2012"
            keyPassword = "appvity2012"
        }
    }
    namespace = "com.appvity.ptth"
    compileSdk = 35
    ndkVersion = flutter.ndkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.appvity.ptth"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        signingConfig = signingConfigs.getByName("debug")
        multiDexEnabled = true
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
            isDebuggable = false
            isMinifyEnabled = false
            isShrinkResources = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
        debug {
            signingConfig = signingConfigs.getByName("debug")
            isDebuggable = true
        }
    }
    flavorDimensions += listOf("default")
    productFlavors {
        create("p2p") {
            minSdk = 28
            targetSdk = 34
            dimension = "default"
            applicationId = "com.appvity.p2p"
            versionCode = 1
            versionName = "1.1"
            signingConfig = signingConfigs.getByName("release")
            matchingFallbacks += listOf("")
        }
        create("esign") {
            minSdk = 28
            targetSdk = 34
            dimension = "default"
            applicationId = "com.appvity.esign"
            versionCode = 1
            versionName = "1.1"
            signingConfig = signingConfigs.getByName("release")
            matchingFallbacks += listOf("")
        }
        create("ptth") {
            minSdk = 28
            targetSdk = 34
            dimension = "default"
            applicationId = "com.appvity.ptth"
            versionCode = 9
            versionName = "1.9"
            signingConfig = signingConfigs.getByName("release")
            matchingFallbacks += listOf("")
        }
    }
    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }
    // For Kotlin projects
    kotlinOptions {
        jvmTarget = "1.8"
    }
}

dependencies {
    implementation("androidx.appcompat:appcompat:1.7.0")
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
    implementation("androidx.multidex:multidex:2.0.1")
}

flutter {
    source = "../.."
}
