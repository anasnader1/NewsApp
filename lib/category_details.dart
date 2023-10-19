import 'package:flutter/material.dart';
import 'package:newsapp/api_manager.dart';
import 'package:newsapp/model/HomeScreenDataClass.dart';
import 'package:newsapp/model/sourceResponse.dart';
import 'package:newsapp/myTheme.dart';
import 'package:newsapp/tabContainer.dart';

class categoryDetails extends StatefulWidget{
  static const String routeName='categoryDetails';
  Categoryy categoryy;
  categoryDetails({ required this.categoryy});

  @override
  State<categoryDetails> createState() => _categoryDetailsState();
}

class _categoryDetailsState extends State<categoryDetails> {
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<SourceResponce?>(
        future: apiManager.getSources(widget.categoryy.id),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator  (
                color: MyTheme.primaryColor,
              ),
            );
          }else if(snapshot.hasError){
              return Column(
                children: [
                  Text('Something went wrong'),
                  ElevatedButton(onPressed: (){
                    apiManager.getSources(widget.categoryy.id);
                  }, child: Text('Try Again'))
                ],
              );
          }
          if(snapshot.data?.status!='ok'){
            return Column(
              children: [
                Text(snapshot.data?.message??''),
                  //ElevatedButton(onPressed: (){}, child: Text('success'))
              ],
            );

          }
          var sourceList=snapshot.data?.sources??[];
          return tabContainer(SourcesList: sourceList);

          },





    );
  }
}
