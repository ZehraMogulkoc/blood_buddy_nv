import 'dart:convert';

import 'package:blood_buddy_nv/screens/staff_drawer.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
class ETR extends StatefulWidget {
  const ETR({Key? key}) : super(key: key);

  @override
  _ETRState createState() => _ETRState();
}

class _ETRState extends State<ETR> {

TextEditingController donorid = TextEditingController();
TextEditingController recipient = TextEditingController();

TextEditingController empid = TextEditingController();
TextEditingController quantity = TextEditingController();
TextEditingController dob = TextEditingController();
String Year ='';
String Month='';
String Date='';
Future<List?> enterTransaction() async {

  var url=
      "http://192.168.1.81/bloodbuddy/transaction.php";
  Uri myUri = Uri.parse(url);
  var response_transaction;
  response_transaction= await http.post(myUri, body: {
    "recipient_name":recipient.text,
    "donor_id":donorid.text,
    "emp_id":empid.text,
    "quantity":quantity.text,
    "Year":Year,
    "Month": Month,
    "Date":Date,
  });

  var data = json.encode(response_transaction.body);
  print(data);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: StaffDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.red,

        title: Text('Enter Transaction Result'),
      ),
      body:Center(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: donorid,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person,
                    color: Colors.red,),
                  hintText: 'Enter donor name?',
                  labelText: 'Donor id*',
                ),
                onSaved: (String? value) {

                },
              ),

              TextFormField(
                controller: recipient,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person,
                    color: Colors.red,),
                  hintText: 'Enter patient  name?',
                  labelText: 'Patient *',
                ),
                onSaved: (String? value) {

                },
              ),


              TextFormField(
                controller: empid,
                decoration: const InputDecoration(
                  icon: Icon(Icons.favorite,
                    color: Colors.red,),
                  hintText: 'Enter your emp id.',
                  labelText: 'Employer id *',
                ),
                onSaved: (String? value) {

                },
              ),
              TextFormField(
                controller: quantity,
                decoration: const InputDecoration(
                  icon: Icon(Icons.favorite,
                    color: Colors.red,),
                  hintText: 'Enter the amount of blood given.',
                  labelText: 'Quantity *',
                ),
                onSaved: (String? value) {

                },
              ),

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

              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),),
                  onPressed:()async{
                    enterTransaction();
                    Fluttertoast.showToast(
                        msg: "The entry wass added",
                        toastLength: Toast.LENGTH_SHORT,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        fontSize: 16.0
                    );

                  },
                  child: Text('Add')
              ),

            ],
          ),
        ),
      ),

    );
  }
}