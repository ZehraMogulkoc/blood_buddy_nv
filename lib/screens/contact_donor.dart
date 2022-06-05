import 'dart:convert';
//hospital personnel
import 'package:blood_buddy_nv/screens/staff_drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
class ContactDonor extends StatefulWidget {
  const ContactDonor({Key? key}) : super(key: key);

  @override
  _ContactDonorState createState() => _ContactDonorState();
}

class _ContactDonorState extends State<ContactDonor> {
  List donorList =[200];
/*getAllDonors()async{
   var response = await http.get("url");

    if(response.statusCode ==200){
      setState(() {
        donorList = json.decode(response.body);
      });
      print(donorList);
      return donorList;
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: StaffDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(

        backgroundColor: Color.fromRGBO(171, 39, 39, 1.0),
        title: Text('Contact Donor'),
        centerTitle: true,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 15,
        //donorList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                tileColor: Color.fromRGBO(206, 203, 203, 1.0),
                leading: Text('A-', style: TextStyle(color: Color.fromRGBO(171, 39, 39, 1.0),
                    fontSize: 30, fontWeight: FontWeight.bold),),
                //Text(donorList[index]['blood type']),
                title: Text('Ankara'),
                //Text(donorList[index]['name']),
                //subtitle
                trailing: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () async {
                      final number = '+90555555555';
                      await FlutterPhoneDirectCaller.callNumber(number);
                    },
                    child:Text('Call')),
              ),
              SizedBox(height: 10,),
            ],
          );
        },
      ),
    );
  }
}