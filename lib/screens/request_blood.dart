import 'dart:convert';

import 'package:blood_buddy_nv/screens/blood_request.dart';
import 'package:blood_buddy_nv/screens/loading.dart';
import 'package:blood_buddy_nv/screens/staff_drawer.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'login_page.dart';
//for hospital personnel
class RequestBlood extends StatefulWidget {


  @override
  _RequestBloodState createState() => _RequestBloodState();
}

class _RequestBloodState extends State<RequestBlood> {


  bool isRequesting = false;

  final _formKey = GlobalKey<FormState>();


  TextEditingController displayNameController = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController bloodNeedDateController = TextEditingController();

var month;
var year;
var day;
  pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year+1),
    );

    if(date !=null){
      setState(() {
      //  bloodNeedDateController.text = date.year.toString() +"-"+  +"-"+date.day.toString();
    month=date.month.toString();
        year=date.year.toString();
        day=date.day.toString();
      });
    }
  }
  Future<List?> registerRecipient() async {

    var url ="http://192.168.1.30/bloodbuddy/recipient_register.php";

    var url_blodd="http://192.168.1.30/bloodbuddy/blood_recipient.php";
    Uri myUri_blood = Uri.parse(url_blodd);
    //connect to register.php file
    Uri myUri = Uri.parse(url);
    var response;
    String recepient="Recipient";
    var response_blood;
    response= await http.post(myUri, body: {
      "first_name": displayNameController.text,
      "last_name": lastname.text,
      "status":recepient,
     // "Date": bloodNeedDateController.text,
      "phone": phoneNumberController.text,
      "address": addressController.text,
      "Year":year,
      "Month": month,
      "Day":day,
    });
    response_blood=await http.post(myUri_blood, body: {
      "blood_type":bloodGroupController.text,
      "amount": amountController.text,
    });
    var data = json.encode(response.body);
    var data2 = json.encode(response_blood.body);
    print(data2);
print(data);
    Fluttertoast.showToast(
        msg: "Recipient created successfully",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 20.0);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: StaffDrawer(),
        appBar: AppBar(
          title: Text("Request Blood"),
          backgroundColor: Colors.red.shade900,
        ),
        body: Builder(builder: (context){
          return isRequesting?circularLoading():Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Must enter Name ';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.grey,
                          hintText: "Recipient suname",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )
                      ),
                      controller: displayNameController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Recipient Surname';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.grey,
                          hintText: "Recipient Surname",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )
                      ),
                      controller: lastname,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.numberWithOptions(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Blood Amount is Required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.grey,
                          hintText: "Blood Amount (in Pin)",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )
                      ),
                      controller: amountController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.numberWithOptions(),
                      validator: (value) {
                        if (value!.isEmpty || value!.length!=10) {
                          return 'Provide 10 Digit Number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Phone Number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )
                      ),
                      controller: phoneNumberController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: DropdownButtonFormField(
                      validator: (value) => value == null
                          ? 'Please provide Blood Group' : null,
                      onChanged: (val){
                        bloodGroupController.text = val as String;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )
                      ),
                      hint: Text("Blood Group"),
                      items: [
                        DropdownMenuItem(child: Text("A+"),
                          value: "A+",),
                        DropdownMenuItem(child: Text("B+"),
                          value: "B+",),
                        DropdownMenuItem(child: Text("O+"),
                          value: "O+",),
                        DropdownMenuItem(child: Text("AB+"),
                          value: "AB+",),
                        DropdownMenuItem(child: Text("A-"),
                          value: "A-",),
                        DropdownMenuItem(child: Text("B-"),
                          value: "B-",),
                        DropdownMenuItem(child: Text("O-"),
                          value: "O-",),
                        DropdownMenuItem(child: Text("AB-"),
                          value: "AB-",),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: TextFormField(
                      onTap: (){
                        pickDate();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Provide Date';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "When Do you Need?",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fillColor: Colors.pinkAccent
                      ),
                      controller: bloodNeedDateController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                        child: Text("Request Blood", style: TextStyle(color: Colors.white, fontSize: 20.0),),
                        color: Colors.red.shade900,
                        onPressed: () async{
                          registerRecipient();
                        }
                    ),
                  ),

                ],
              ),
            ),
          );
        })
    );
  }
}
