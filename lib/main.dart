import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Inter",
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Kontest"),
        ),
        body: Center(
          child: Text("Kontest"),
        ),
      ),
    );
  }
}
