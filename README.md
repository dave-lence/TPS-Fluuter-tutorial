link 1. https://app.pluralsight.com/paths/skill/build-mobile-web-applications-with-flutter

link 2. https://app.pluralsight.com/course-player?clipId=2ae5a3a7-3782-4c19-87a7-fec0929b14e3

link 1 is the general link to the flutter tutorial that has multiple tutorial links, while link 2 is a section under link 1.
Everything in this repo would be found under link 2.  



# TPS-Flutter-tutorial
Learning Flutter 2

# Getting Started
## Staring your enviroment
i. STARTING YOUR SEVER: To run your flutter app you use the cmd 'flutter run' and select the platform you want to target.

ii. CHECKING FLUTTER INSTALLATION: Run this cmd 'flutter doctor' to check your flutter installation and fix any possible error.

iii. FLUTTER COMMAND HELP: Run 'flutter -h' for different flutter cmds.

## File at the root level
### pubspec.yaml:
 This file holds information about your flutter app like dependescies and enviroments.
 *** WARNING: pubspec.yaml file must be in your root directory else you would face issues starting your application or your application would not run and the name of the file should be left as the default name(pubspec.yaml).
### pubspec.lock: 
 This file would be automatically generated when running your flutter app(only when you dont have it in your root directory).
### flutter_application_1.iml:
 This file takes the name of your flutter app and should not be ultered or changed 
### analysis_options.yaml:
 This files analysis dart file would check for erros, warning and lints
### .metadata:
 This file tracks properties of this Flutter project. Used by Flutter tool to assess capabilities and perform upgrades etc.
### .packages:
The .packages file is a file used by the Dart language and Flutter to manage package dependencies in a Flutter project.

## folder structure
### android: 
the "android" folder is a critical part of the project structure, and it contains the Android-specific code and configuration necessary for building and running your Flutter app on the Android platform. 
    i. app: This subfolder contains the Android-specific code for your   Flutter app. It's the entry point for your app's Android codebase.

        i. src: This is where the Java code for your Flutter app resides. The structure mirrors that of a standard Android app but specifically in the java file under the main folder

        ii. build.gradle: This file defines the build configuration for the entire Android project. It includes settings related to gradle and build plugins.

    ii. gradle: This folder contains configuration files for the Gradle build system, which is used to build Android apps.
    
        i. wrapper: all files under the wrapper folder are wrapper scripts for running Gradle commands. They ensure that the correct version of Gradle is used, even if it's not installed globally on your system.
    
    iii. gradle.properties: This file includes the path to your Android SDK installation. It's automatically generated and should not be modified manually.

    iv. build.gradle: This folder contains the output of the Android build process, including APK files and other build artifacts.
        
### ios:
the "ios" folder is a directory that contains the iOS-specific code and configuration required for building and running your Flutter app on the iOS platform. 

    i. Flutter: This subfolder contains generated code and configuration files for integrating Flutter with iOS. It includes files like flutter_export_environment.sh and Generated.xcconfig.

    ii. Runner: This subfolder contains the iOS-specific code for your Flutter app. It's the entry point for your app's iOS codebase.

        i. Assets.xcassets: This is the asset catalog for your app. It contains images, icons, and other assets used by your iOS app.

        ii. It is used for storing the default localized resources of an app, such as strings, images, and other assets that are not specifically localized to a particular language or region.

    iii. Runner.xcodeproj: This is the Xcode project file for your Flutter app. You typically won't need to directly open this file, as you'll work with the workspace file instead.

    iv. Runner.xcworkspace: This is the Xcode workspace file that you'll open when working with your Flutter app on the iOS platform. It includes your app's project, as well as the CocoaPods-managed dependencies.

### lib:
 It's where you write and organize the majority of your app's logic, UI components, and functionality. The lib folder is where you build and organize your app's features, screens, widgets, and other components.

    i. main.dart: The main entry point of your Flutter app is usually the main.dart file, located directly inside the lib folder. This is where your app's execution begins.

### linux: 
It is there in case you want to build your app for linux. Yes, you can safely delete it. If you ever regret deleting it and want to create it back, you can write flutter create . inside your project folder.

### macos: 
It is there in case you want to build your app for mac OS. Yes, you can safely delete it. If you ever regret deleting it and want to create it back, you can write flutter create . inside your project folder.

### windows: 
It is there in case you want to build your app for windows. Yes, you can safely delete it. If you ever regret deleting it and want to create it back, you can write flutter create . inside your project folder.

### test:
 the test folder is used to store unit tests and integration tests for your Flutter app.
    
    i. widget_test.dart: It is where you can write widget tests for testing the UI components of your Flutter app.

### web:
This folder is used to store web-specific code and assets for building and running your Flutter app as a web application.


This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
