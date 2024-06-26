import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
        source: ImageSource.gallery, imageQuality: 60);

    setState(() {
      imagepath = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TakeaPhoto(imageselected: () {
      handlepickImagedata().then((value) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShowResult(selectedimage: imagepath!)));
      });
    });
  }
}
// Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: const Text("Ornamental Recognition"),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             imagepath != null ? Image.file(File(imagepath!.path)) : Container(),
//           ],
//         ),
//       ),
//       bottomNavigationBar: SizedBox(
//         width: MediaQuery.of(context).size.width * 0.60,
//         height: 50,
//         child: ElevatedButton(
//             onPressed: () {
//               handlepickImagedata();
//             },
//             child: const Text("Pick Image")),
//       ),
//     );