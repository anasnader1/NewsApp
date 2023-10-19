import 'package:flutter/material.dart';
import 'package:newsapp/HomeScreen.dart';
import 'package:newsapp/category_details.dart';
import 'package:newsapp/mainNews.dart';
import 'package:newsapp/model/newsResponse.dart';
import 'package:newsapp/myTheme.dart';
import 'package:newsapp/settings_tab.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get onCategoryClick => null;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName:(context) => HomeScreen(),
        categoryDetails.routeName:(context) =>categoryDetails(categoryy: onCategoryClick,),
        Settings.routeName:(context) => Settings(),
        mainNews.routeName:(context) => mainNews()
      },
      theme: MyTheme.lightTheme,
    );
  }
}
