import 'package:allstars/model/star.dart';
import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List stars = PowerStar.powerStars;
    List gridTiles = map(stars, (index, Star s){
      return Padding(
        padding: EdgeInsets.all(4.0),
        child: Container(
            child: GridTile(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                    )
                  ],
                )
            )
        ),
      );
    });
    return DraggableScrollbar.semicircle(
      alwaysVisibleScrollThumb: true,
      controller: scrollController,
      child: GridView.count(
        crossAxisCount: 5,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: gridTiles,
      ),
    );
  }
}

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}
