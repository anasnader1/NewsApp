import 'package:flutter/material.dart';

import 'HomeScreen.dart';
import 'model/HomeScreenDataClass.dart';
import 'myTheme.dart';

class categoryFragment extends StatelessWidget {
  var Categories =Categoryy.getCategories();
  Function onCategoryClick;
  categoryFragment({required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: Colors.white,

            child: Image.asset('assets/images/pattern.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            )),
        Scaffold(
          backgroundColor: Colors.transparent,


          body: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Pick your category \nof interest',
                      style: Theme.of(context).textTheme.titleMedium),
                ),
                Expanded(
                  child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18
                  ),
                    itemBuilder: (context,index){
                      return InkWell(
                          onTap: (){
                            onCategoryClick(Categories[index]);

                          },
                          child:
                          CategoryItem(category: Categories[index], index: index)
                      );
                    },
                    itemCount: Categories.length,


                  ),
                )

              ],
            ),
          ),
        )
      ],
    );
  }
}
