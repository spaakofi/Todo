import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo',
      theme: ThemeData(
    
        primaryColor: const  Color.fromRGBO(37, 43, 103, 1),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Color.fromRGBO(37, 43, 103, 1),
        )
      ),
      home: HomePage(),
    );
  }
}
