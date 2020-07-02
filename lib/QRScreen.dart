import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

class QRScreen extends StatefulWidget {
  @override
  _QRScreenState createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  final dm = Barcode.dataMatrix();

  @override
  Widget build(BuildContext context) {
    var phoneNumber = "";
    TextEditingController _qrTextEditingController = TextEditingController();

    _generateQR(text) {
      setState(() {
        phoneNumber = 'https://api.WhatsApp.com/send?phone=' + text;
        print("updated phone number");
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Share QR"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            BarcodeWidget(
              barcode: Barcode.qrCode(
                errorCorrectLevel: BarcodeQRCorrectionLevel.high,
              ),
              data: phoneNumber,
              width: 200,
              height: 200,
            ),
            TextFormField(
              controller: _qrTextEditingController,
              decoration: InputDecoration(
                  hintText: 'QR input',
                  labelText: 'QR input',
                
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              color: Colors.blue,
              onPressed: () => _generateQR(_qrTextEditingController.text),
              child: Text(
                'Generate QR',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
                "Any one can start conversation with you by scanning the qr code."),
          ],
        ),
      ),
    );
  }
}
