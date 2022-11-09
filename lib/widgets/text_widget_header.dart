import 'package:flutter/material.dart';

class TextWidgetHeader extends SliverPersistentHeaderDelegate
{
  String? title;
  TextWidgetHeader({this.title});
  @override
  Widget build(BuildContext context, double shrinkOffSet,bool overlapsContent)
  {
    return InkWell(
      child: Container(

        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Colors.red.shade900,Colors.red.shade400,Colors.red.shade900],
            ),
        ),
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: InkWell(
          child: Text(
            title!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "DancingScript",
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 2,
            ),
          ),
        ),

      ),

    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 50;

  @override
  // TODO: implement minExtent
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    throw UnimplementedError();
  }

}
