import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';

class ShowResult extends StatefulWidget {
  final XFile selectedimage;
  const ShowResult({super.key, required this.selectedimage});

  @override
  State<ShowResult> createState() => _ShowResultState();
}

class _ShowResultState extends State<ShowResult> {
  List? _result = [];

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
          path: widget.selectedimage.path,
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
    double widthsize = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff88B648),
        automaticallyImplyLeading: false,
        title: const Text(
          "Ornamental",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: 220,
            width: widthsize,
            decoration: const BoxDecoration(
                color: Color(0xff88B648),
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(20))),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                        height: 169,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: FileImage(File(widget.selectedimage.path)),
                            fit: BoxFit
                                .cover, // Adjust the fit as per your requirement
                          ),
                        ))),
                const SizedBox(width: 10),
                Expanded(child: Text("ssd"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
