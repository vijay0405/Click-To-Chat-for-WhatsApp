import 'package:flutter/material.dart';

import 'helpScreen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'Raleway', fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Colors.teal,
          child: Text('WhatsApp Number',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(255, 254, 229, 1),
              )),
        ),
        SizedBox(
          height: 20,
        ),
        buildListTile("Help", Icons.help, () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => HelpScreen(),
            ),
          );
        }),

      ],
    ));
  }
}
