import 'package:flutter/material.dart';
import 'package:kontest/services/auth.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  AuthService auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Profile",
                style: Theme.of(context).textTheme.headline1,
              ),
              ElevatedButton(
                onPressed: () {
                  auth.signOut();
                },
                child: Text(
                  "Sign Out",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
