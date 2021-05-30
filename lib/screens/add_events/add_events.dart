import 'package:flutter/material.dart';

class AddEvent extends StatefulWidget {
  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            "Add Event",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
    );
  }
}
