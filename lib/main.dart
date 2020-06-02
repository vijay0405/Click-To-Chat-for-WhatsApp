import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  _launchURL() async {
    const url = 'https://api.WhatsApp.com/send?phone=917894561235';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsNum',
      home: Scaffold(
        appBar: AppBar(
          title: Text('WhatsApp Number'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: _launchURL,
            child: Text('Start Messaging'),
          ),
        ),
      ),
    );
  }
}
