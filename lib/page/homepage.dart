import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List? _result = [];
  final ImagePicker _imagePicker = ImagePicker();
  XFile? imagepath;
  bool isload = false;

  void handlepickImagedata() async {
    final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 60);

    setState(() {
      imagepath = image;
    });

    if (imagepath != null) {
      imageClassification();
    }
  }

  Future<void> loadModel() async {
    Tflite.close();
    await Tflite.loadModel(
        model: 'assets/model_unquant.tflite',
        labels: 'assets/labels.txt',
        isAsset: true,
        useGpuDelegate: false);
  }

  Future<void> imageClassification() async {
    try {
      var imgClassification = await Tflite.runModelOnImage(
          path: imagepath!.path,
          numResults: 14,
          threshold: 0.03,
          imageMean: 127.5,
          imageStd: 127.5,
          asynch: true);
      setState(() {
        _result = imgClassification!;
      });
      debugPrint("$_result");
    } catch (error) {
      debugPrint('$error');
    }
  }

  @override
  void initState() {
    loadModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Ornamental Recognition"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            imagepath != null ? Image.file(File(imagepath!.path)) : Container(),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: MediaQuery.of(context).size.width * 0.60,
        height: 50,
        child: ElevatedButton(
            onPressed: () {
              handlepickImagedata();
            },
            child: Text("Pick Image")),
      ),
    );
  }
}
