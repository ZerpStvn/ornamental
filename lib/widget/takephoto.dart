import 'package:flutter/material.dart';

class TakeaPhoto extends StatelessWidget {
  final Function imageselected;
  const TakeaPhoto({super.key, required this.imageselected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F3F0),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.90,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8))),
              child: Padding(
                padding: const EdgeInsets.all(19.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Take A Photo",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const Text(
                      "Ensure your photo is taken clearly and from above any obstacles to achieve accurate results.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 29),
                    Container(
                      height: 110,
                      width: 110,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/image/plant.png'))),
                    ),
                    const SizedBox(height: 29),
                    const ListTile(
                        leading: Icon(
                          Icons.light_mode_outlined,
                          color: Colors.green,
                        ),
                        title: Text(
                          "Good lighting",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        subtitle: Text(
                          "Good lighting ensures clear details, accurate colors, and reduces noise in photos.",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        )),
                    const SizedBox(height: 29),
                    const ListTile(
                        leading: Icon(
                          Icons.photo_outlined,
                          color: Colors.green,
                        ),
                        title: Text(
                          "Clear Image",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        subtitle: Text(
                          "Clear image ensures details are sharp and easily recognizable, providing a better visual",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0), // Adjust padding as needed
            child: ElevatedButton(
              onPressed: () {
                imageselected();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffF69C33),
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0), // Adjust button height
                minimumSize: const Size(
                    double.infinity, 50), // Set minimum button width and height
              ),
              child: const Text(
                "Take a Photo",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
