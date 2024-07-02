import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ornamental/page/result.dart';
import 'package:ornamental/widget/takephoto.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? imagepath;
  bool isload = false;

  Future<void> handlepickImagedata() async {
    final XFile? image = await _imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 60,
    );

    if (!mounted) return;

    if (image != null) {
      setState(() {
        imagepath = image;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShowResult(
              selectedimage: imagepath!,
              ishome: true,
            ),
          ),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No image selected')),
      );
    }
  }

  Future<bool> _requestPermissions() async {
    final statuses = await [
      Permission.camera,
      Permission.storage,
    ].request();

    return statuses[Permission.camera]!.isGranted &&
        statuses[Permission.storage]!.isGranted;
  }

  @override
  void initState() {
    _requestPermissions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TakeaPhoto(imageselected: () {
      handlepickImagedata();
    });
  }
}
