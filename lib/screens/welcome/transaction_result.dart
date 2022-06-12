
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart'as http;

import '../donor_drawet.dart';
//this is the home page that all users are listed
class TransactionResult extends StatefulWidget {

  const TransactionResult({Key? key}) : super(key: key);

  @override
  State<TransactionResult> createState() => _TransactionResultState();
}
List transactionList= [];
class _TransactionResultState extends State<TransactionResult> {
  //with http class, connect to php files and reach the all Data class
  getAllTransactions()async{
    print("wheree");
    Uri myUri = Uri.parse("http://192.168.1.25/bloodbuddy/allTransaction.php"); //10.0.2.2 is need to run on android emilators
    var response=await http.get(myUri);
    if(response.statusCode==200){
      setState(() {
        transactionList= json.decode(response.body);
        print(transactionList);
      });
      //print(userList);
      return transactionList;
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTransactions(); //list all suers
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DonorDrawer(),
      appBar: AppBar(
backgroundColor: Color.fromRGBO(
    171, 39, 39, 1.0),
        title: Text('Past Actions '),
      ),
      body:  ListView.builder(
          itemCount: transactionList.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100 ,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ListTile( // list users id, name  and phone information
                  leading: Text(transactionList[index]["donor_id"],style: TextStyle(color: Colors.white,fontSize: 30)),
                  title:Text(transactionList[index]["recipient_name"],style: TextStyle(color: Colors.white,fontSize: 20)) ,
                  subtitle:Row(children:[ Text(transactionList[index]["date_out"]??'date not entered',style: TextStyle(color: Colors.white,fontSize: 15)),SizedBox(width: 20),Text( transactionList[index]["quantity"]??'quantity not entered',style: TextStyle(color: Colors.white,fontSize: 15))]) ,

                ),
              ),
            );
          }),
    );
  }
}