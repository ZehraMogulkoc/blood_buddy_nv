

import 'package:blood_buddy_nv/screens/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/providers.dart';
import 'login_page.dart';

class enterinPage extends StatefulWidget {
  const enterinPage({Key? key}) : super(key: key);

  @override
  _enterinPageState createState() => _enterinPageState();
}

class _enterinPageState extends State<enterinPage> {
  @override
  Widget build(BuildContext context) {
    bool? isDonor=Provider.of<providers>(context).isDonor;
    return Scaffold(
      appBar: AppBar( title: Center(child: Text("Blood Buddy")),
        flexibleSpace: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
        colors: [Colors.red, Colors.orange],
      ),
      ),)),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Colors.red, Colors.white])
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text("Welcome to Blood Buddy",  style: TextStyle(
                      fontSize: 30,
                      color: Colors.red.shade900,
                      fontWeight: FontWeight.bold

                    ),),
                  ),
                ),
                Image.asset(
                  'assets/images/cute.png',
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 30),
                FlatButton(

                onPressed: ()  {
                  isDonor=Provider.of<providers>(context, listen: false).ChangeToHospitalStaff(false);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage(isDonor)));
                },


                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                color:  Colors.deepOrange,
                padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                child: Text('Continue As a Hospital Personnel',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    )),
              ),
                SizedBox(height: 15),
                FlatButton(

                  onPressed: ()  {
                    isDonor=Provider.of<providers>(context, listen: false).ChangeToHospitalStaff(true);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage(isDonor)));
                  },


                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  color:  Colors.deepOrange,
                  padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                  child: Text('Continue As a Donor',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      )),
                ),
                SizedBox(height: 15),
               ],

            ),
          ),


        ),
      ),
    );
  }
}
