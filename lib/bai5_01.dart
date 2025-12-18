import 'dart:math';
import 'package:flutter/material.dart';

class ChangeColorApp extends StatefulWidget {
  const ChangeColorApp({super.key});

  @override
  State<ChangeColorApp> createState() => _ChangeColorAppState();
}

class _ChangeColorAppState extends State<ChangeColorApp> {
  Color brcolor = Colors.purple;
  String stringColor = "purple";
  // Danh sách 5 màu
  List<String> stringListColor = [
    'brown',
    'green',
    'red',
    'deepOrange',
    'blueAccent',
  ];
  List<Color> listColor = [
    Colors.brown,
    Colors.green,
    Colors.red,
    Colors.deepOrange,
    Colors.blueAccent,
  ];

  void _changeColor() {
    setState(() {
      var random = Random();
      var r = random.nextInt(listColor.length);
      brcolor = listColor[r];
      stringColor = stringListColor[r];
    });
  }

  void _reSetColor() {
    setState(() {
      brcolor = Colors.cyanAccent;
      stringColor = 'cyanAccent';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: brcolor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Màu hiện tại",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(stringColor),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _changeColor,
                    child: const Text("Change Color"),
                  ),
                  SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: _reSetColor,
                    child: const Text("Reset color"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
