import 'package:flutter/material.dart';
import 'package:newsapp/newsContainer.dart';
import 'package:newsapp/tabItem.dart';

import 'model/sourceResponse.dart';

class tabContainer extends StatefulWidget {
  List<Sources> SourcesList;

  tabContainer({required this.SourcesList});

  @override
  State<tabContainer> createState() => _tabContainerState();
}

class _tabContainerState extends State<tabContainer> {
  var selectedIndex =0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: widget.SourcesList.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index ){
                selectedIndex=index;
                setState(() {

                });

              },
                isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs: widget.SourcesList.map((sources) =>
                    tabItem(iSelected: selectedIndex==widget.SourcesList.indexOf(sources),
                        sources: sources)).toList()

            ),
            Expanded(child: newsContainer(sources: widget.SourcesList[selectedIndex],))
          ],
        ));
  }
}
