import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kontest/services/auth.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  final textController = TextEditingController();

  String phoneNumber = "";
  final AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Form(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/kontest_logo.png',
                  height: 200,
                ),
                Text(
                  "Kontest",
                  style: Theme.of(context).textTheme.headline1,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Phone Number",
                    ),
                    onChanged: (val) {
                      setState(() {
                        phoneNumber = val;
                      });
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print(phoneNumber);
                    auth.signInWithNumber('+91$phoneNumber');
                  },
                  child: Text("Get OTP"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
