import 'package:flutter/material.dart';
import 'package:newsapp/myTheme.dart';

import 'model/sourceResponse.dart';

class tabItem extends StatelessWidget {
bool iSelected;
Sources sources;
tabItem({required this.iSelected,required this.sources});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: MyTheme.primaryColor,
          width: 3
        ),
        color:  iSelected?MyTheme.primaryColor:Colors.transparent

      ),
      child:Text(sources.name??'',style:
        TextStyle(
          fontSize: 18,
          color: iSelected?MyTheme.whiteColor:MyTheme.primaryColor
        )
        ,)  ,


    );
  }
}
