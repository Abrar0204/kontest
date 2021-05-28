import 'package:flutter/material.dart';

class Home extends StatelessWidget {
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
          Image.asset('assets/images/kontest_logo.png'),
          Text(
            "Kontest Of",
            style: Theme.of(context).textTheme.headline1,
          ),
        ],
      )),
    );
  }
}
