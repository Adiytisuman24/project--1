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
        detectionImagesGroupName: "AR Resources",
        // set the detection images group name for the image detection
        planeDetection: ARPlaneDetection.horizontal,
        // enable horizontal plane detection
        enableLightEstimation: true,
        // enable light estimation
      ),
    );
  }

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    
    // Add a 3D model to the scene
    final node = ARKitNode(
      geometry: ARKitBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01),
      position: Vector3(0, 0, -0.5),
    );
    arkitController.add(node);
    arkitController.onNodeTap = (name) => print("Tapped on node: $name");
    // add a tap event on the node
  }
}
