import 'package:blood_buddy_nv/screens/entering_page.dart';
import 'package:blood_buddy_nv/models/providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> providers())

      ],
      child: GetMaterialApp(
        home: enterinPage(),
      ),
    );
  }
}
