import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class ETR extends StatefulWidget {
  const ETR({Key? key}) : super(key: key);

  @override
  _ETRState createState() => _ETRState();
}

class _ETRState extends State<ETR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,

        title: Text('Enter Transaction Result'),
      ),
      body:Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person,
                  color: Colors.red,),
                hintText: 'Enter donor name?',
                labelText: 'Donor *',
              ),
              onSaved: (String? value) {

              },
            ),

            TextFormField(
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
              decoration: const InputDecoration(
                icon: Icon(Icons.favorite,
                  color: Colors.red,),
                hintText: 'Enter the amount of blood given.',
                labelText: 'Quantity *',
              ),
              onSaved: (String? value) {

              },
            ),


            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.alarm_add_sharp,
                  color: Colors.red,),
                hintText: 'Enter date of donation',
                labelText: 'Date *',
              ),
              onSaved: (String? value) {

              },
            ),
           ElevatedButton(
               style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all(Colors.red),),
                 onPressed:(){
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

    );
  }
}