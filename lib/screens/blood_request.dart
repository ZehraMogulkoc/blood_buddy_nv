import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:blood_buddy_nv/screens/loading.dart';

class ShowRequests extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0)
        ),
        padding: EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Stack(
                children: <Widget>[
                  Container(
                      height: 120.0,
                      width: 100.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Container(
                              color: Colors.black87,
                              alignment: Alignment.center,
                              child: Text('Location', style: TextStyle(color: Colors.white, )),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child:  Container(
                              alignment: Alignment.center,
                              color: Colors.red,
                              child: Text('bloodGroup', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      )
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            "Required in particular date",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontFamily: "Gotham",
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.hdr_strong, color: Colors.redAccent,),
                          ],
                        ),
                        SizedBox(height: 8.0,),
                        Row(
                          children: <Widget>[
                            Icon(Icons.phone, color: Colors.blue,),
                            InkWell(
                              onTap: (){

                              },
                              child: Text(
                                "Call Now",
                                style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontFamily: "Gotham", fontSize: 18.0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}