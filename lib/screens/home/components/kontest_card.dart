import 'package:flutter/material.dart';
import 'package:kontest/model/kontest.dart';
import 'package:kontest/screens/home/kontest_page.dart';

class KontestCard extends StatefulWidget {
  final Kontest kontest;
  KontestCard({Key key, this.kontest}) : super(key: key);
  @override
  _KontestCardState createState() => _KontestCardState();
}

class _KontestCardState extends State<KontestCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => KontestPage(
              kontestData: widget.kontest,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // color: Colors.white,
          color: Theme.of(context).accentColor,
          image: DecorationImage(
            image: AssetImage(widget.kontest.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        height: 300,
        width: 250,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.7, 0.8],
                    colors: [
                      Colors.transparent,
                      Theme.of(context).primaryColor,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black45,
                ),
                width: 250,
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor,
                ),
                child: Icon(Icons.favorite),
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
                widget.kontest.title,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
