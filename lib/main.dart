import 'package:flutter/material.dart';
import 'package:todo/listScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListScreen(),
      title: 'Todo',
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
    );
  }
}
