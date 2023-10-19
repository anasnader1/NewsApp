import 'package:flutter/material.dart';
import 'package:newsapp/Category_fragment.dart';
import 'package:newsapp/Search.dart';
import 'package:newsapp/category_details.dart';
import 'package:newsapp/model/HomeScreenDataClass.dart';
import 'package:newsapp/model/newsResponse.dart';
import 'package:newsapp/model/sourceResponse.dart';
import 'package:newsapp/myTheme.dart';
import 'package:newsapp/newsContainer.dart';
import 'package:newsapp/settings_tab.dart';
import 'myTheme.dart';


class HomeScreen extends StatefulWidget {

  static const String routeName = 'HomeScreen';


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: MyTheme.primaryColor),
                child: Center(
                    child: Text(
                      'News App!',
                      style: Theme.of(context).textTheme.titleLarge,
                    ))),
            ListTile(
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.list,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Category',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.settings,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Settings',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, Settings.routeName);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'News App',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: MyTheme.whiteColor),
        ),
        actions: [
          IconButton(onPressed: (){
            showSearch(context: context,
                delegate:Search(author: 'author')
                // CustomSearchDelegate()
            );
          },
              icon: Icon(Icons.search))
        ],
      ),


      body:

        selectedCategory==null?
      categoryFragment(onCategoryClick: onCategoryCLick):
            categoryDetails(categoryy: selectedCategory!)
      ,);

  }

  Categoryy? selectedCategory;

void onCategoryCLick(Categoryy newcategoryy ){
  selectedCategory=newcategoryy;
  setState(() {

  });

}
}

// class CustomSearchDelegate extends SearchDelegate{
//   List<String> searchTerms = [
//     'MARCA',
//     'Al-Jazeera',
//     'BBC',
//     'ABC',
//     'CNN',
//
//   ];
//
//   @override
//   Widget buildLeading (BuildContext context){
//     return
//       IconButton(
//         icon: Icon(Icons.arrow_back),
//         onPressed: (){
//          close(context, null);
//         },
//       );
//
//   }
//
//
//
//   @override
//   Widget buildResults(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var fruit in searchTerms) {
//       if (fruit.toLowerCase().contains (query.toLowerCase())) {
//         matchQuery.add(fruit);
//       }
//     }
//     return ListView.builder (
//         itemCount: matchQuery.length,
//         itemBuilder: (context, index) {
//           var result = matchQuery [index];
//           return ListTile(
//             title: Text(result),
//           );
//         }// ListTile
//           ); // ListView.builder
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var fruit in searchTerms) {
//       if (fruit.toLowerCase().contains (query.toLowerCase())) {
//         matchQuery.add (fruit);
//       }
//     }
//     return ListView.builder (
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         var result = matchQuery [index];
//         return ListTile(
//           title: Text (result),
//         ); // ListTile
//       },
//     ); // ListView.builder
//   }
//
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//
//     return[
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: (){
//           query='';
//         },
//       ),
//     ];
//   }
//
// }

class CategoryItem extends StatelessWidget{
  Categoryy category;
  int index;
  CategoryItem({required this.category,required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color:  category.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(index%2==0?20:0),
          bottomRight: Radius.circular(index%2!=0?20:0),
        )
      ),
      child:  Column(
        children: [
          Image.asset(category.imageurl,height: MediaQuery.of(context).size.height*0.15,),
          Text(category.title,style: Theme.of(context).textTheme.titleMedium! .copyWith(color: Colors.white),),

        ],
      ),

      );

  }
}
