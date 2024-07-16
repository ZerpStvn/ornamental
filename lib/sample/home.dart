import 'package:flutter/material.dart';

class Anotherhome extends StatefulWidget {
  const Anotherhome({super.key});

  @override
  State<Anotherhome> createState() => _AnotherhomeState();
}

class _AnotherhomeState extends State<Anotherhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ornamental"),
      ),
    );
  }
}
