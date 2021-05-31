import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kontest/screens/wrapper.dart';
import 'package:kontest/services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: "Inter",
          primaryColor: Color(0xff1e2630),
          accentColor: Color(0xff8250ca),
          scaffoldBackgroundColor: Color(0xff1e2630),
          canvasColor: Color(0xff1e2630),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Color(0xff2F3B49),
          ),
          textTheme: TextTheme(
            subtitle1: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
            subtitle2: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
            headline1: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            headline2: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            headline3: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            headline4: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            bodyText1: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        home: Wrapper(),
      ),
    );
  }
}
