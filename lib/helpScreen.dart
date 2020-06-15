import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Help"),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "This App will help you in sending messages to new numbers which are not saved in your conacts.",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Image.asset(
                'assets/images/select-country.jpg',
                cacheHeight: 300,
                cacheWidth: 250,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Choose the country from the picker shown in above picture.",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Image.asset(
                  'assets/images/phone-input.jpg',
                  cacheHeight: 300,
                  cacheWidth: 250,
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 60),
              child: Text(
                "Enter the phone number in the input shown in above picture and click on start messaging button.",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        )));
  }
}
