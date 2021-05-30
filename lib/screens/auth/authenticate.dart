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
  PanelController _panelController = PanelController();
  bool panelOpen = false;
  String dropdownValue = '+91';
  @override
  void initState() {
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

  Widget countryCodeDropDown() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.expand_more),
      iconSize: 24,
      elevation: 16,
      itemHeight: 200,
      underline: Container(height: 2, color: Theme.of(context).accentColor),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items:
          <String>['+91', '+1'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget phoneNumberForm() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Form(
          child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: countryCodeDropDown(),
            title: TextFormField(
              controller: phoneNumber,
              decoration: InputDecoration(
                hintText: "Enter your Phone Number",
                focusColor: Theme.of(context).accentColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'By signing up, I agree to the Terms of Service and Privacy Policy, including usage of Cookies',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () async {
              setState(() {
                isLoading = true;
              });
              await signWithPhoneNumber();
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(10000),
              ),
              child: Text("GET OTP"),
            ),
          )
        ],
      )),
    );
  }

  Widget otpForm() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Form(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: otp,
              decoration: InputDecoration(
                focusColor: Theme.of(context).primaryColor,
                hintText: "Enter OTP",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'By signing up, I agree to the Terms of Service and Privacy Policy, including usage of Cookies',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                PhoneAuthCredential phoneAuthCredential =
                    PhoneAuthProvider.credential(
                        verificationId: verificationID, smsCode: otp.text);
                signInWithCredential(phoneAuthCredential);
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(10000),
                ),
                child: Text("VERIFY OTP"),
              ),
            )
          ],
        ),
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

  Widget slidePanel() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(panelOpen ? Icons.expand_more : Icons.expand_less),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: !panelOpen
              ? Text(
                  'Get Started',
                  style: Theme.of(context).textTheme.headline3,
                )
              : Text(
                  'Create your Account',
                  style: Theme.of(context).textTheme.headline3,
                ),
        ),
        isLoading
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : !otpSent
                ? phoneNumberForm()
                : otpForm()
      ],
    );
  }

  Widget bodyPanel() {
    return Stack(
      children: [
        Container(
          child: videoPlayer(),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          top: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/kontest_swords.png",
                height: 80,
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                child: Text(
                  'Kontest',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          bottom: 120,
          child: Center(
            child: Text(
              "Create, join events across globe",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SlidingUpPanel(
        controller: _panelController,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        color: Theme.of(context).primaryColor,
        onPanelOpened: () {
          setState(() {
            panelOpen = true;
          });
        },
        onPanelClosed: () {
          setState(() {
            panelOpen = false;
          });
        },
        body: bodyPanel(),
        panel: slidePanel(),
      ),
    );
  }
}
