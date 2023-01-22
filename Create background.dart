import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:image_picker/image_picker.dart';

class MyARApp extends StatefulWidget {
  @override
  _MyARAppState createState() => _MyARAppState();
}

class _MyARAppState extends State<MyARApp> {
  ARKitController arkitController;
  String backgroundImage;

  @override
  void dispose() {
    arkitController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AR App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_photo_alternate),
            onPressed: _pickBackgroundImage,
          ),
        ],
      ),
      body: ARKitSceneView(
        onARKitViewCreated: onARKitViewCreated,
        skybox: backgroundImage,
        // set the background image
      ),
    );
  }

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
  }

  _pickBackgroundImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      backgroundImage = pickedFile.path;
    });
  }
}
