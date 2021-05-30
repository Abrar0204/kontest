import 'package:flutter/material.dart';
import 'package:kontest/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService auth = AuthService();
  int currentIndex = 0;
  List<String> kontest = ["Kontest #1", "Kontest #2", "Kontest #3"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/koins.png",
                      height: 40,
                      width: 40,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      children: [
                        Text(
                          "20 Koins",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Get Koins",
                          style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).accentColor),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.notifications,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Enrolled Kontests",
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  "See All",
                )
              ],
            ),
            Container(
              height: 350,
              child: ListView.builder(
                itemCount: kontest.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // color: Colors.white,
                      color: Theme.of(context).accentColor,
                      image: DecorationImage(
                        image: AssetImage("assets/images/chess2.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 300,
                    width: 250,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black,
                                  Colors.transparent,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black45,
                            ),
                            width: 250,
                            height: 300,
                          ),
                        ),
                        Positioned(
                          bottom: 50,
                          left: 15,
                          child: Text(
                            "1 - 3 June, 2021",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                        Positioned(
                          left: 15,
                          bottom: 20,
                          child: Text(
                            kontest[index],
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
