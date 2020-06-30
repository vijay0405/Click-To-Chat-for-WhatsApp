import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:barcode_widget/barcode_widget.dart';

class QRScreen extends StatelessWidget {
  final dm = Barcode.dataMatrix();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey();
    var phoneNumber = "";

    return Scaffold(
      appBar: AppBar(
        title: Text("Share QR"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                  decoration:
                      InputDecoration(labelText: 'Enter Your Phone Number'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Invalid input!';
                    }
                  },
                  onSaved: (value) {
                    phoneNumber = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                    "Share this geneated qr with any one instead of sharing number."),
                // Text("Ex: (8099891235)",
                //     style: TextStyle(fontFamily: "RobotoCondensed"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
