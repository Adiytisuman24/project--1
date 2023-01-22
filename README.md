# project--1
Snap - Ar - lensathon participation project 
To use the ARKit plugin in your Flutter app, you will need to add the arkit_plugin package as a dependency in your pubspec.yaml file. Here is an example of how your pubspec.yaml file might look like with the arkit_plugin package added:


dependencies:
  flutter:
    sdk: flutter
  arkit_plugin: ^0.4.0

You also need to add the following permission 
to your AndroidManifest.xml file

and this to your Info.plist file


<key>NSCameraUsageDescription</key>
<string>This app needs access to the camera to function</string>
