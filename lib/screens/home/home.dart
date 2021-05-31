import 'package:flutter/material.dart';
import 'package:kontest/model/kontest.dart';
import 'package:kontest/screens/home/components/kontest_card.dart';

import 'package:kontest/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService auth = AuthService();
  int currentIndex = 0;
  List<Kontest> kontests = [
    Kontest(
      title: "Kontest #1",
      imageUrl: "assets/images/chess2.jpg",
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    ),
    Kontest(
      title: "Kontest #2",
      imageUrl: "assets/images/chess2.jpg",
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    ),
    Kontest(
      title: "Kontest #3",
      imageUrl: "assets/images/chess2.jpg",
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    ),
  ];

  Widget appBar() {
    return Row(
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
                      fontSize: 14, color: Theme.of(context).accentColor),
                ),
              ],
            ),
          ],
        ),
        Icon(
          Icons.notifications,
        ),
      ],
    );
  }

  Widget kontestCards() {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: kontests.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return KontestCard(
            kontest: kontests[index],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            appBar(),
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
            SizedBox(
              height: 20,
            ),
            kontestCards()
          ],
        ),
      ),
    );
  }
}
