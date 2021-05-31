import 'package:flutter/material.dart';
import 'package:kontest/screens/add_events/add_events.dart';
import 'package:kontest/screens/home/home.dart';
import 'package:kontest/screens/profile/profile.dart';
import 'package:kontest/screens/search/search.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  Widget bottomNavbar() {
    return Container(
      margin: EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 10,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(
            color: Colors.white,
            size: 28,
            opacity: 1,
          ),
          unselectedIconTheme: IconThemeData(
            opacity: 0.5,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(4.0),
                child:
                    Icon(currentIndex == 0 ? Icons.home : Icons.home_outlined),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(Icons.search),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(currentIndex == 2
                    ? Icons.add_circle
                    : Icons.add_circle_outline),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                    currentIndex == 3 ? Icons.person : Icons.person_outline),
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: currentIndex == 0
          ? Home()
          : currentIndex == 1
              ? Search()
              : currentIndex == 2
                  ? AddEvent()
                  : Profile(),
      bottomNavigationBar: bottomNavbar(),
    );
  }
}
