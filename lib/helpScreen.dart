import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Help"),
        ),
        body: Column(
          children: <Widget>[
            Lottie.asset(
              'assets/character.json',
              width: 100,
              height: 150,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "This App will help you in sending messages to new numbers which are not saved in your conacts.",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          Image.asset('assets/images/phone-input.jpg'),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "This App will help you in sending messages to new numbers which are not saved in your conacts.",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ));
  }
}
