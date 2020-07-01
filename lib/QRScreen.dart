import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:barcode_widget/barcode_widget.dart';

class QRScreen extends StatelessWidget {
  final dm = Barcode.dataMatrix();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey();
    var phoneNumber = "";
    TextEditingController searchEditor = TextEditingController();

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
              data: 'https://api.WhatsApp.com/send?phone=' + phoneNumber,
              width: 200,
              height: 200,
            ),
            TextField(
                controller: searchEditor,
                autofocus: false,
                keyboardType: TextInputType.number,
                onChanged: (str) {
                  phoneNumber = (str == null) ? "" : str;
                }),
            SizedBox(
              height: 20,
            ),
            Text(
                "Any one can start conversation with you by scanning the qr code."),
            // Text("Ex: (8099891235)",
            //     style: TextStyle(fontFamily: "RobotoCondensed"))
          ],
        ),
      ),
    );
  }
}
