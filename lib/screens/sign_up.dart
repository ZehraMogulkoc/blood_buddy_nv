import 'dart:convert';

import 'package:blood_buddy_nv/models/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'login_page.dart';

class SignUp extends StatefulWidget {
  const SignUp(bool? isDonor, {Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController first_name = TextEditingController();
  TextEditingController last_name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController hostpital = TextEditingController();
  String Year ='';
  String Month='';
  String Date='';

  @override
  Widget build(BuildContext context) {
    bool isDonor = Provider.of<providers>(context).isDonor;
    Future<List?> register() async {
      var url =
          "http://192.168.1.16/bloodbuddy/donor_register.php";
      var url_donor =
          "http://192.168.1.16/bloodbuddy/donor.php";
      var url_staff =
          "http://192.168.1.16/bloodbuddy/hospital_staff.php"; //use your own ip
      //connect to register.php file
      Uri myUri = Uri.parse(url);
      Uri myUri_donor = Uri.parse(url_donor);
      Uri myUri_staff = Uri.parse(url_staff);
      var response;
      var response_donor;
      var response_staff;
      if(!isDonor){
        response_staff = await http.post(myUri_staff, body: {
          "first_name": first_name.text,
          "last_name": last_name.text,
          "password": password.text,
          "Year": Year,
          "Month": Month,
          "Date": Date,
          "phone": phone.text,
          "email":email.text,
          "address": address.text,

        });
         response = await http.post(myUri, body: {
          "first_name": first_name.text,
          "last_name": last_name.text,
          "password": password.text,
          "Year": Year,
          "Month": Month,
          "Date": Date,
          "phone": phone.text,
          "email":email.text,
          "address": address.text,

        });
      }else{
         response = await http.post(myUri, body: {
          "first_name": first_name.text,
          "last_name": last_name.text,
          "password": password.text,
          "Year": Year,
          "Month": Month,
          "Date": Date,
          "phone": phone.text,
          "email":email.text,
          "address": address.text,

        });
      }


      var data = json.encode(response.body);
      print(data);
      if (data != '"New record created successfullyNew contact record created successfully"') {
        Fluttertoast.showToast(
          //check if user is already exits or not
            msg: 'User allready exit!');
      } else {
        Fluttertoast.showToast(
            msg: "Account created successfully",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 20.0);
        //Navigator.pushReplacementNamed(context, '/page1');
        try {
          setState(() {
            bool isDonor = true;
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginPage(isDonor)));
          });
        } catch (e) {
          print(e);
        }
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Blood Buddy'),
        backgroundColor: Colors.red.shade900,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red, Colors.white])),
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
                        controller: first_name,
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
                      ),
                    ),
                    TextMethod('Last Name'),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                      child: TextFormField(
                        controller: last_name,
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
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextMethod('Email'),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                      child: TextFormField(
                        controller: email,
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
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextMethod('Phone'),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                      child: TextFormField(
                        controller: phone,
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
                      ),
                    ),
                    TextMethod('Address'),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                      child: TextFormField(
                        controller: address,
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
                      ),
                    ),
                    TextMethod('Date Of Birth'),
                    RaisedButton(
                        child: Text(
                          "Select your date of birth",
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1600),
                                  lastDate: DateTime(2030))
                              .then((date) {
                            setState(() {

                              Year =  date?.year.toString() ?? '';
                              Month = date?.month.toString() ?? '';
                              Date = date?.day.toString() ?? '';
                            });
                          });
                        }),
                    TextMethod('Password'),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10),
                      child: TextFormField(
                        controller: password,
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
                      ),
                    ),
                    !isDonor ? TextMethod('Hospital Name') : SizedBox.shrink(),
                    if (!isDonor)
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0, left: 10),
                        child: TextFormField(
                          controller: hostpital,
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
                        register();
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
