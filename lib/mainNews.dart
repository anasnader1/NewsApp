import 'package:flutter/material.dart';
import 'package:newsapp/api_manager.dart';
import 'package:newsapp/model/newsResponse.dart';
import 'package:newsapp/model/sourceResponse.dart';

import 'newsContainer.dart';

class mainNews extends StatefulWidget {
  static const String routeName='mainNews';

  @override
  State<mainNews> createState() => _mainNewsState();
}

class _mainNewsState extends State<mainNews> {




  @override
  Widget build(BuildContext context) {
    var argus=ModalRoute.of(context)?.settings.arguments as arg;

     // var news = snapshot.data?.articles??[];
    return Scaffold(
      appBar: AppBar(
        title: Text(argus.args.title??''),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children: [

          Container(

              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18)
              ),
              child: Image.network(argus.args.urlToImage??'')),
          Text(argus.args.author??''),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(argus.args.title??'',style: Theme.of(context).textTheme.titleSmall,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(argus.args.publishedAt??'',textAlign: TextAlign.right,),
          ),
          Text(argus.args.content??'')



        ],
      ),

    );

  }
}
