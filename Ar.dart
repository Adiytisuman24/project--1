import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';

class MyARApp extends StatefulWidget {
  @override
  _MyARAppState createState() => _MyARAppState();
}

class _MyARAppState extends State<MyARApp> {
  ARKitController arkitController;

  @override
  void dispose() {
    arkitController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ARKitSceneView(
        onARKitViewCreated: onARKitViewCreated,
      ),
    );
  }

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;

    // Add an AR object to the scene
    final node = ARKitNode(
      geometry: ARKitSphere(radius: 0.1),
      position: Vector3(0, 0, -0.5),
    );
    arkitController.add(node);
  }
}
