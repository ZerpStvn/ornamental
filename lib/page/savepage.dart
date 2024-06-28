import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ornamental/model/savefav.dart';
import 'package:provider/provider.dart';

class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var bookmarkState = Provider.of<BookmarkState>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 19),
        backgroundColor: const Color(0xff88B648),
        title: const Text("Saved"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: bookmarkState.bookmarkedItems.length,
                  itemBuilder: (context, index) {
                    var item =
                        bookmarkState.bookmarkedItems.keys.toList()[index];
                    var bookmarkedItem = bookmarkState.bookmarkedItems[item];
                    String processedLabel = bookmarkedItem!['title']
                        .replaceFirst(RegExp(r'^\d+\s*'), '');
                    return ListTile(
                      tileColor: Colors.white,
                      leading: SizedBox(
                        width: 50,
                        height: 50,
                        child: ClipOval(
                            child: Image.file(
                                fit: BoxFit.cover,
                                File(bookmarkedItem['path']))),
                      ),
                      title: Text(processedLabel),
                      subtitle: Text("${bookmarkedItem['disc']}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          bookmarkState.toogleRemove("${bookmarkedItem['id']}");
                          deleteImage('${bookmarkedItem['path']}');
                          setState(() {});
                        },
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  Future<void> deleteImage(String imagePath) async {
    try {
      final file = File(imagePath);
      if (await file.exists()) {
        await file.delete();
        debugPrint('Deleted image: $imagePath');
      } else {
        debugPrint('Image not found: $imagePath');
      }
    } catch (e) {
      debugPrint('Error deleting image: $e');
    }
  }
}
