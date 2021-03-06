import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:share/share.dart';

class QRScreen extends StatefulWidget {
  @override
  _QRScreenState createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  var countryCode = "91";

  void _changedcountry(ct) {
    countryCode = ct.toString().substring(1);
    print(countryCode);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _qrTextEditingController = TextEditingController();
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Share QR"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(37, 211, 102, 1).withOpacity(0.5),
                  Color.fromRGBO(7, 94, 84, 1).withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 1],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: deviceSize.width > 600 ? 2 : 1,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 8.0,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                        height: 360,
                        constraints: BoxConstraints(minHeight: 260),
                        width: deviceSize.width * 0.75,
                        padding: EdgeInsets.all(16.0),
                        child: Form(
                          key: _formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                CountryCodePicker(
                                  onChanged: _changedcountry,
                                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                  initialSelection: 'IN',
                                  favorite: ['+91', 'IN'],
                                  // optional. Shows only country name and flag
                                  showCountryOnly: false,
                                  // optional. Shows only country name and flag when popup is closed.
                                  showOnlyCountryWhenClosed: false,
                                  // optional. aligns the flag and the Text left
                                  alignLeft: false,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: _qrTextEditingController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      hintText: 'Enter Phone Number',
                                      labelText: 'Your Phone Number',
                                      border: OutlineInputBorder()),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                FlatButton(
                                  color: Colors.blue,
                                  onPressed: () {
                                    return showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          // Retrieve the text the that user has entered by using the
                                          // TextEditingController.
                                          content: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                BarcodeWidget(
                                                  barcode: Barcode.qrCode(
                                                    errorCorrectLevel:
                                                        BarcodeQRCorrectionLevel
                                                            .high,
                                                  ),
                                                  data: 'https://api.WhatsApp.com/send?phone=' +
                                                      countryCode +
                                                      _qrTextEditingController
                                                          .text,
                                                  width: 200,
                                                  height: 200,
                                                ),
                                                Text(countryCode +
                                                    _qrTextEditingController
                                                        .text),
                                                Text(
                                                    "Any one can scan the above qr code to start conversation with you.",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "RobotoCondensed")),
                                                FlatButton.icon(
                                                    onPressed: () {
                                                      Share.share(
                                                          'https://api.WhatsApp.com/send?phone=' +
                                                              countryCode +
                                                              _qrTextEditingController
                                                                  .text);
                                                    },
                                                    icon: Icon(Icons.share),
                                                    label: Text("share"))
                                              ]),
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    'Generate QR',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                    "Any one can start conversation with you by scanning the generated QR code."),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
