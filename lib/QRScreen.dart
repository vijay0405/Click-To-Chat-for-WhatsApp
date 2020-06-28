import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:qr_utils/qr_utils.dart';

class QRScreen extends StatefulWidget {
  @override
  _QRScreenState createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  String _content = 'Undefined';
  String _qrBase64Content = 'Undefined';
  Image _qrImg;

  TextEditingController _qrTextEditingController = TextEditingController();

  String _error;

  @override
  void initState() {
    super.initState();
  }


  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                  "Generate QR: ",
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                TextFormField(
                  controller: _qrTextEditingController,
                  decoration: InputDecoration(
                      hintText: 'QR Content',
                      labelText: 'QR Content',
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 12.0,
                ),
                _qrImg != null
                    ? Container(
                        child: _qrImg,
                        width: 120.0,
                        height: 120.0,
                      )
                    : Image.asset(
                        'assets/images/ic_no_image.png',
                        width: 120.0,
                        height: 120.0,
                        fit: BoxFit.cover,
                      ),
                SizedBox(
                  height: 16.0,
                ),
                FlatButton(
                  color: Colors.blue,
                  onPressed: () => _generateQR(_qrTextEditingController.text),
                  child: Text(
                    'Generate QR',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ])));
  }

  void _generateQR(String content) async {
    if (content.trim().length == 0) {
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text('Please enter qr content')));
      setState(() {
        _qrImg = null;
      });
      return;
    }
    Image image;
    try {
      image = await QrUtils.generateQR(content);
    } on PlatformException {
      image = null;
    }
    setState(() {
      _qrImg = image;
    });
  }



  
}
