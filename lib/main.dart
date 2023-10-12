import 'package:flutter/material.dart';
import 'package:newsapp/HomeScreen.dart';
import 'package:newsapp/category_details.dart';
import 'package:newsapp/myTheme.dart';

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
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName:(context) => HomeScreen(),
        categoryDetails.routeName:(context) => categoryDetails()
      },
      theme: MyTheme.lightTheme,
    );
  }
}
