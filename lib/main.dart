import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: "Inter",
        primaryColor: Color(0xff1e2630),
        accentColor: Color(0xff8250ca),
        scaffoldBackgroundColor: Color(0xff1e2630),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kontest"),
        elevation: 0,
      ),
      body: Center(
        child: Text(
          "Kontest",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
