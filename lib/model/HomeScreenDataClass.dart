import 'package:flutter/material.dart';
import 'package:newsapp/myTheme.dart';

class Categoryy{
  String id;
  String title;
  String imageurl;
  Color color;

  Categoryy(
  {
    required this.title,
    required this.id,
    required this.color,
    required this.imageurl
}
      );
  static List<Categoryy> getCategories(){
return[
    Categoryy(title: 'Sports', id: 'sports', color: MyTheme.redColor, imageurl: 'assets/images/ball.png'),
    Categoryy(title: 'General', id: 'general', color: MyTheme.blueColor, imageurl: 'assets/images/environment.png'),
    Categoryy(title: 'Health', id: 'health', color: Colors.pink, imageurl: 'assets/images/health.png'),
    Categoryy(title: 'Business', id: 'business', color: Colors.brown, imageurl: 'assets/images/bussines.png'),
    Categoryy(title: 'Entertainment', id: 'entertainment', color: Colors.lightBlueAccent, imageurl: 'assets/images/environment.png'),
    Categoryy(title: 'Science', id: 'science', color: Colors.yellow, imageurl: 'assets/images/science.png'),
    Categoryy(title: 'Technology', id: 'technology', color: MyTheme.primaryColor, imageurl: 'assets/images/science.png'),
];
  }
}