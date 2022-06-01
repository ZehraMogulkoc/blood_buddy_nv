
import 'package:blood_buddy_nv/models/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';
class SignUp extends StatefulWidget {
  const SignUp( bool? isDonor, {Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

var name;

class _SignUpState extends State<SignUp> {


  String email='';
  String password='';
  @override
  Widget build(BuildContext context) {
    bool isDonor= Provider.of<providers>(context).isDonor;

    return Scaffold(

      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Blood Buddy'),
        backgroundColor: Colors.red.shade900,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.red, Colors.white])
        ),
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white10.withOpacity(0.6),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextMethod('First Name'),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "User Name",
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                          ),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          name = value;

                        },
                      ),
                    ),
                    TextMethod('Last Name'),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "User Last Name",
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                          ),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          name = value;

                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextMethod('Email'),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(
                            color: Colors.white,
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
                    TextMethod('Phone'),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "Phone Number",
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                          ),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          name = value;

                        },
                      ),
                    ),
                    TextMethod('Address'),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "Address",
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                          ),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          name = value;

                        },
                      ),
                    ),
                    TextMethod('Date Of Birth'),

                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "Date Of Birth",
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                          ),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          password = value;
                        },

                      ),
                    ),
                    TextMethod('Password'),

                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                          ),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          password = value;
                        },

                      ),
                    ),
                  !isDonor?   TextMethod('Hospital Name'): SizedBox.shrink(),
if(!isDonor) Padding(
  padding: const EdgeInsets.only(right: 10.0, left: 10),
  child: TextFormField(
    textAlign: TextAlign.center,
    keyboardType: TextInputType.visiblePassword,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      labelText: "Hospital Name",
      labelStyle: TextStyle(
        color: Colors.white,
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
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.red.shade900),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            )),

                      ),

                      onPressed: () async {
                        print(isDonor);
                        try {

                          if(true){

                            Fluttertoast.showToast(
                                msg: "Account created successfully",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.redAccent,
                                textColor: Colors.white,
                                fontSize: 20.0);
                            setState(() {
                              //  showProgress = false;
                              bool isDonor=true;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage(isDonor)));
                            });
                          }
                        }
                        catch(e){
                          print(e);
                        }
                      },

                      child: Text(
                        'Create The Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



TextMethod(String value) {
  return Padding(
    padding: const EdgeInsets.only(right: 10.0),
    child: Text(
      value,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Colors.red.shade900,
        fontSize: 20,
      ),
    ),
  );
}