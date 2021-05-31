import 'package:flutter/material.dart';
import 'package:kontest/model/kontest.dart';

class KontestPage extends StatefulWidget {
  final Kontest kontestData;

  KontestPage({Key key, @required this.kontestData}) : super(key: key);

  @override
  _KontestPageState createState() => _KontestPageState();
}

class _KontestPageState extends State<KontestPage> {
  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  Widget backDropImage() {
    return Image.asset(
      widget.kontestData.imageUrl,
      height: MediaQuery.of(context).size.height * 0.4,
      fit: BoxFit.cover,
    );
  }

  Widget appbar() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black45,
            Colors.transparent,
          ],
          // stops: [0.5, 0.6],
        ),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.favorite,
            ),
          )
        ],
      ),
    );
  }

  Widget joinKontestButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          height: MediaQuery.of(context).size.width * 0.15,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).accentColor,
                blurRadius: 6,
                spreadRadius: 4,
              )
            ],
          ),
          child: Center(
            child: Text(
              "Join Kontest",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
      ),
    );
  }

  Widget dateAndTime() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.calendar_today,
              size: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              getDateRange(),
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.alarm,
              size: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              getTimeRange(),
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ],
    );
  }

  String getDateRange() {
    DateTime start = widget.kontestData.startTime;
    DateTime end = widget.kontestData.endTime;
    if (start.month == end.month)
      return "${start.day} - ${end.day} ${months[start.month - 1]}, ${start.year}";
    else
      return "${start.day} ${months[start.month]} - ${end.day} ${months[end.month]}, ${start.year}";
  }

  String getTimeRange() {
    DateTime start = widget.kontestData.startTime;
    DateTime end = widget.kontestData.endTime;
    int startHour = start.hour;
    int endHour = end.hour;
    String startAMorPM = "am";
    String endAMorPM = "am";
    if (startHour > 12) {
      startHour -= 12;
      startAMorPM = "pm";
    }
    if (endHour > 12) {
      endHour -= 12;
      endAMorPM = "pm";
    }
    return "$startHour$startAMorPM - $endHour$endAMorPM";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            backDropImage(),
            appbar(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(
                  top: 80,
                  left: 20,
                  right: 20,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Theme.of(context).primaryColor,
                    ],
                    stops: [0.1, 0.2],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.kontestData.title,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    dateAndTime(),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Description",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: ListView(
                        children: [
                          Text(widget.kontestData.description),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            joinKontestButton()
          ],
        ),
      ),
    );
  }
}
