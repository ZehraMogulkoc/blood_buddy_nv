import 'package:blood_buddy_nv/models/providers.dart';
import 'package:blood_buddy_nv/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'dart:async';


import 'package:provider/provider.dart';

import 'sign_up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage(bool? isDonor, {Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';


  @override
  Widget build(BuildContext context) {
    bool isDonor= Provider.of<providers>(context).isDonor;

    return Scaffold(
      resizeToAvoidBottomInset: false,
appBar: AppBar(backgroundColor: Colors.red.shade900,),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.red, Colors.white])
        ),
        child: SafeArea(
          child: Center(
            child: CustomScrollView(
              slivers: [ SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      'Blood Buddy',
                      style: TextStyle(fontSize: 40, color:  Colors.red.shade900,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                          prefixIcon: Icon(Icons.email),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontFamily: 'Roboto',
                          ),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                          prefixIcon: Icon(Icons.lock),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(
                            fontFamily: 'Roboto',
                          ),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: 30,
                    ),

                    SizedBox(height: 15),
                    FlatButton(

                      onPressed: () async {
                        setState(() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => TestStartingScreen()));
                        });
                        try {
                          if (true) {
                            setState(() {

                            });
                          } else {
                            Fluttertoast.showToast(
                                msg: "Şifre veya Email yanlış. Lütfen tekrar dene",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 20.0);
                          }
                        } catch (e) {
                          print(e);
                        }
                      },


                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color:  Color(0xFFDE2828),
                      padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                      child: Text('Log In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          )),
                    ),


                    SizedBox(height: 15),
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => SignUp( isDonor)));
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color: Colors.red.shade900 ,
                      padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                      child: Text('Sign Up!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          )),
                    ),



                  ],
                ),

              ),],

            ),
          ),
        ),
      ),
    );
  }

}




