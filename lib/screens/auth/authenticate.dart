// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kontest/services/auth.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:video_player/video_player.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  final textController = TextEditingController();
  VideoPlayerController _controller;
  final phoneNumber = TextEditingController();
  final otp = TextEditingController();
  bool otpSent = false;
  bool isLoading = false;
  String verificationID = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.asset("assets/videos/login.mp4")
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });
  }

  final AuthService auth = AuthService();

  Widget phoneNumberForm() {
    return Form(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextFormField(
            controller: phoneNumber,
            decoration: InputDecoration(
              hintText: "Phone Number",
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            setState(() {
              isLoading = true;
            });
            await signWithPhoneNumber();
          },
          child: Text("Get OTP"),
        ),
      ],
    ));
  }

  Widget otpForm() {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              controller: otp,
              decoration: InputDecoration(
                hintText: "Enter OTP",
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              PhoneAuthCredential phoneAuthCredential =
                  PhoneAuthProvider.credential(
                      verificationId: verificationID, smsCode: otp.text);
              signInWithCredential(phoneAuthCredential);
            },
            child: Text("Verify OTP"),
          )
        ],
      ),
    );
  }

  Future signWithPhoneNumber() async {
    try {
      print(phoneNumber.text);
      await auth.instance.verifyPhoneNumber(
        phoneNumber: '+91${phoneNumber.text}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          setState(() {
            isLoading = false;
          });
          signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          setState(() {
            isLoading = false;
          });
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int resendToken) async {
          setState(() {
            isLoading = false;
            otpSent = true;
            this.verificationID = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            isLoading = false;
            this.verificationID = verificationId;
          });
        },
      );
    } catch (err) {
      print(err.toString());
    }
  }

  signInWithCredential(PhoneAuthCredential credential) async {
    await auth.instance.signInWithCredential(credential);
  }

  Widget videoPlayer() {
    return Container(
      child: _controller != null ? VideoPlayer(_controller) : Container(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        body: Container(
          child: videoPlayer(),
        ),
        panel: Container(
          color: Theme.of(context).primaryColor,
          alignment: Alignment.center,
          child: isLoading
              ? Container(
                  child: CircularProgressIndicator(),
                )
              : !otpSent
                  ? phoneNumberForm()
                  : otpForm(),
        ),
      ),
    );
  }
}
