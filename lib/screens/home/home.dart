import 'package:flutter/material.dart';
import 'package:kontest/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService auth = AuthService();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            "Home",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
    );
  }
}
