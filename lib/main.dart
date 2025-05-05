import 'package:flutter/material.dart';
import 'package:my_grocery_app/features/home/Ui/home.dart';
//import 'package:flutter_bloc/features/home/Ui/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Bloc',
      theme: ThemeData(
        //primaryColor: Colors.teal
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Home()
    );
  }
}

