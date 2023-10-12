import 'package:flutter/material.dart';
import 'package:newsapp/api_manager.dart';
import 'package:newsapp/model/newsResponse.dart';
import 'package:newsapp/model/sourceResponse.dart';
import 'package:newsapp/myTheme.dart';

class newsContainer extends StatelessWidget {
  Sources sources;
  newsContainer({required this.sources});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
      future: apiManager.getNewsBySource(sources.id??''),

        builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(
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
              // ElevatedButton(onPressed: (){}, child: Text('Try Again'))
            ],
          );

        }
        var news = snapshot.data?.articles??[];
        return ListView.builder(itemBuilder: (context,index){
          return  Container(
              child:
              Column(
                crossAxisAlignment:CrossAxisAlignment.stretch,
                children: [
                  Image.network(news[index].urlToImage??''),
                  Text(news[index].title??'',style: Theme.of(context).textTheme.titleSmall,),
                  Text(news[index].publishedAt??'',textAlign: TextAlign.right,)


                ],
              ),


          );
          },
          itemCount: news.length,
          );
        });
  }
}
