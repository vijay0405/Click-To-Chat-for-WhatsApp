import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:barcode_widget/barcode_widget.dart';

class QRScreen extends StatelessWidget {
  final dm = Barcode.dataMatrix();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Share QR"),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: [
              BarcodeWidget(
                barcode: Barcode.qrCode(
                  errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                ),
                data: 'https://pub.dev/packages/barcode_widget',
                width: 200,
                height: 200,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
