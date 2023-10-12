import 'package:flutter/material.dart';
import 'package:newsapp/api_manager.dart';
import 'package:newsapp/model/sourceResponse.dart';
import 'package:newsapp/myTheme.dart';
import 'package:newsapp/tabContainer.dart';

class categoryDetails extends StatelessWidget{
  static const String routeName='categoryDetails';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        centerTitle: true,
        title: Text('News App',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: MyTheme.whiteColor),
        ),
        elevation: 0,

      ),
      body: FutureBuilder<SourceResponce?>(
        future: apiManager.getSources(),
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
                  ElevatedButton(onPressed: (){}, child: Text('Try Again'))
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

          )



    );
  }
}
