import 'package:flutter/material.dart';
import 'dart:ui';

import 'entering_page.dart';

class StaffDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(250),
        ),
        child: SizedBox(
          width: 250,
          child: Drawer(
            child: new ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  //Color(0xff4367b1)
                  decoration: BoxDecoration(
                    color: Color(0xFF973030),
                  ),
                  accountName: new Text(
                    '',
                    style: TextStyle(
                      fontSize: 1,
                      fontWeight: FontWeight.w800,
                      //color: Colors.grey[300],
                      color: Colors.black,
                    ),
                  ),
                  accountEmail: new Text(
                    'Welcome!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ),
                new ListTile(
                  title: new Text(
                    'Blood Requests',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                  leading: new Icon(
                    Icons.list_alt_outlined,
                    size: 26.0,
                    color: Colors.black,
                  ),
                ),
                new ListTile(
                  title: new Text(
                    'Contact Donors',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                  leading: new Icon(
                    Icons.phone,
                    size: 26.0,
                    color: Colors.black,
                  ),
                ),
                new ListTile(
                  title: new Text(
                    'SignOut',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.push(context,   MaterialPageRoute(builder: (context) => enterinPage()));
                  },
                  leading: new Icon(
                    Icons.logout,
                    size: 26.0,
                    color: Colors.black,
                  ),
                ),
                new Divider(
                  color: Colors.black38,
                ),
                new ListTile(
                  title: new Text(
                    'Close Menu',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                  leading: new Icon(
                    Icons.close,
                    size: 26.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}