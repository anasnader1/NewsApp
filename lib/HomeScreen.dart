import 'package:flutter/material.dart';
import 'package:newsapp/myTheme.dart';
import 'myTheme.dart';

class HomeScreen extends StatelessWidget{
  static const String routeName='HomeScreen';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer:Drawer(
         child: ListView(
           children: [
             DrawerHeader(
               decoration: BoxDecoration(
                 color: MyTheme.primaryColor
               ), child:Center(child: Text('News App!',style: Theme.of(context).textTheme.titleLarge,))
             ),
             ListTile(
               title:  Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Icon(Icons.list,size: 30,color: Colors.black,),
                   ),
                   Text('Category',style: Theme.of(context).textTheme.titleMedium,),
                 ],
               ),
               onTap: () {
               },
             ),
             ListTile(
               title: Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Icon(Icons.settings,size: 30,color: Colors.black,),
                   ),
                   Text('Settings',style: Theme.of(context).textTheme.titleMedium,),
                 ],
               ),
               onTap: () {
               },
             ),
           ],
         ),
       ),
        appBar:
        AppBar(
        centerTitle: true,
        title: Text('News App',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(color: MyTheme.whiteColor),
      ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Pick your category of interest',style: Theme.of(context).textTheme.titleLarge),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset('assets/images/sports.png'),
              ),
              Image.asset('assets/images/politics.png'),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset('assets/images/health.png'),
              ),
              Image.asset('assets/images/business.png'),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset('assets/images/enviroment.png'),
              ),
              Image.asset('assets/images/science.png'),
            ],
          ),
        ],
      ),
    );
  }
}
