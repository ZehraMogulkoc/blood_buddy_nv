import 'package:flutter/material.dart';
class TransactionResult extends StatefulWidget {
  const TransactionResult({Key? key}) : super(key: key);

  @override
  _TransactionResultState createState() => _TransactionResultState();
}

class _TransactionResultState extends State<TransactionResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title:Text(' Transaction Result'),
        ),
        body:
        Center(
          child: Container(
              width: 300.0,
              height: 300.0,
              margin: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text('The blood you gave was given to our patient and his life was saved. Thamk you so much your blood.'),
                    SizedBox(height: 10,),
                    Image.asset('assets/heart2.jpg')
                  ],
                ),
              )
          ),
        )



    );
  }
}