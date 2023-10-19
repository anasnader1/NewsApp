import 'package:flutter/material.dart';
import 'package:newsapp/api_manager.dart';
import 'package:newsapp/mainNews.dart';
import 'package:newsapp/model/newsResponse.dart';
import 'package:newsapp/model/sourceResponse.dart';
import 'package:newsapp/myTheme.dart';

class newsContainer extends StatefulWidget {
  Sources sources;
  newsContainer({required this.sources});

  @override
  State<newsContainer> createState() => _newsContainerState();
}

class _newsContainerState extends State<newsContainer> {
  final scrollController=ScrollController();

  List<Articles>newss=[];
@override
  void initState() {
  scrollController.addListener(endList);
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
      future: apiManager.getNewsBySource(widget.sources.id??''),

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
        var newss = snapshot.data?.articles??[];
        return ListView.builder(
          controller: scrollController,

          itemBuilder: (context,index){
          return  InkWell(
            onTap: (){
              Navigator.pushNamed(context, mainNews.routeName,arguments: arg(args: newss[index]));

            },
            child: Container(padding: EdgeInsets.all(10),
                child:
                Column(
                  crossAxisAlignment:CrossAxisAlignment.stretch,
                  children: [

                    Container(

                      clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18)
                        ),
                        child: Image.network(newss[index].urlToImage??'')),
                    Text(newss[index].author??''),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(newss[index].title??'',style: Theme.of(context).textTheme.titleSmall,),
                    ),
                    Text(newss[index].publishedAt??'',textAlign: TextAlign.right,)


                  ],
                ),


            ),
          );
          },
          itemCount: newss.length,
          );
        });
  }
  int page=0;
  endList()async{
    if(scrollController.position.pixels >= scrollController.position.maxScrollExtent){
      page ++ ;
      // print(pagesize);
      var newsResponceList = await apiManager.getNewsBySource(widget.sources.id??'',pageNum:page.toString());
      // print(newsResponceList?.articles?.first.title);
      // print(newss.length);
      newss.addAll(newsResponceList?.articles??[]);
      setState(() {
      });
    }
  }
}
class arg{
  Articles args;
  arg({required this.args});
}