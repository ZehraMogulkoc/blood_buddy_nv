import 'dart:convert';
//both
import 'package:blood_buddy_nv/models/providers.dart';
import 'package:blood_buddy_nv/screens/contact_donor.dart';
import 'package:blood_buddy_nv/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:async';


import 'package:provider/provider.dart';

import 'entering_page.dart';
import 'sign_up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage(bool? isDonor, {Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var user= Provider.of<providers>(context).user;
    bool isDonor= Provider.of<providers>(context).isDonor;
    String status= isDonor ?"Donor" :"Medical Personnel";
    Future<List?> login(bool isDonor)async{

      Uri myUri = Uri.parse("http://10.0.2.2/bloodbuddy/donor_login.php");
      final response=await http.post(myUri,body:{
        //connect to login.php file and check if user exits and the password is correct. I f it is, then log in
        "email": email.text,
        "password": password.text,
        "status": status,
      });
      var datauser=json.decode(response.body);

      if(datauser != '"hiçbir veri post edilmedi"'){
        print("başarılı olmalı");
        print(datauser);
        //Navigator.pushReplacementNamed(context, '/page1');
        setState(() {
          if(isDonor){
            var currentUser =Provider.of<providers>(context,listen: false).currentUser(datauser);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TestStartingScreen()));}
          else{
            var currentUser =Provider.of<providers>(context,listen: false).currentUser(datauser);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContactDonor()));
          }
        });
      }else{
        Fluttertoast.showToast(
            msg: "This user does not exists. Try again or sign up!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 20.0);
      }
      setState(() {
        email.text=datauser[0]['first_name'];
      });

    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
appBar: AppBar(backgroundColor: Colors.red.shade900,leading: IconButton(
  icon: Icon(Icons.arrow_back, color: Colors.black),
  onPressed: () => Navigator.push(context,  MaterialPageRoute(builder: (context) => enterinPage()),)
), ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
image: DecorationImage(
          alignment: Alignment.center,
          matchTextDirection: true,
          repeat: ImageRepeat.noRepeat,
          image: AssetImage("assets/images/images.png"),
        )

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
                        controller: email,
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
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: TextFormField(
                        controller: password,
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

                      ),
                    ),
                    SizedBox(
                      height: 120,
                      width: 30,
                    ),

                    SizedBox(height: 15),
                    FlatButton(

                      onPressed: () async {
                        print(email.text);
                        login(isDonor);

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




