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
    if (await _requestPermissions()) {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 60,
      );

      if (!mounted) return;

      if (image != null) {
        // final directory = await getApplicationDocumentsDirectory();
        // final localSaveDirectory = Directory('${directory.path}/localsave');
        // if (!await localSaveDirectory.exists()) {
        //   await localSaveDirectory.create(recursive: true);
        // }
        // final imagePath = '${localSaveDirectory.path}/my_image.png';
        // final File imageFile = File(imagepath!.path);
        // await imageFile.copy(imagePath);
        // debugPrint(imagePath);
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
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permissions not granted')),
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
  Widget build(BuildContext context) {
    return TakeaPhoto(imageselected: () {
      handlepickImagedata();
    });
  }
}
