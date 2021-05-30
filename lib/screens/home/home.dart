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
    return Scaffold(
      appBar: AppBar(
        title: Text("Kontest"),
        elevation: 0,
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            "Kontest Of",
            style: Theme.of(context).textTheme.headline1,
          ),
          ElevatedButton(
            onPressed: () {
              auth.signOut();
            },
            child: Text("Sign Out"),
          )
        ],
      )),
    );
  }
}
