import 'package:flutter/material.dart';
class PastActions extends StatefulWidget {
  const PastActions({Key? key}) : super(key: key);

  @override
  _PastActionsState createState() => _PastActionsState();
}

class _PastActionsState extends State<PastActions> {
  Future<void> _showMyDialog(String date) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          //backgroundColor: Colors.black26.withOpacity(0.3),
          title:  Text('$date'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                //Text('This is a demo alert dialog.'),

                Text('You gave x amount of blood to User1 on 01/02/2022.'),

              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close',style: TextStyle(color: Colors.redAccent),),

              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.red,
        title: Text('See Past Actions'),
      ),
      body:Column(
        children: [
          ListTile(
              title: const Text("01/02/2022",style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle:  Text('You gave x amount of blood to User1 on 01/02/2022. ') ,

              onTap: () { _showMyDialog('01/02/2022'); }
          ),
          Divider(),
          ListTile(
              title: const Text("23/05/2022",style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle:  Text('You gave x amount of blood to User1 on 23/05/2022 ') ,

              onTap: () { _showMyDialog('23/05/2022'); }
          )

        ],
      ),
    );
  }
}