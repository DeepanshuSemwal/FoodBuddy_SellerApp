import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wow_food_seller/upload_screens/upload_item_screen.dart';
import 'package:wow_food_seller/widgets/item_design.dart';
import 'package:wow_food_seller/widgets/text_widget_header.dart';

import '../global/global.dart';
import '../models/items.dart';
import '../models/menus.dart';
import '../upload_screens/upload_menu_screen.dart';
import '../widgets/progress_bar.dart';
class ItemsScreen extends StatefulWidget {

  final Menus? model;
  ItemsScreen({required this.model});


  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.red.shade900,Colors.red.shade400,Colors.red.shade900],
              )
          ),

        ),
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          sharedPreferences!.getString("name")!,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add_a_photo_outlined,
              color: Colors.white,
            ),

            onPressed: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (c)=>ItemUploadScreen(model: widget.model),));
            },

          ),
        ],

      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(delegate: TextWidgetHeader(title: widget.model!.menuTitle.toString() + " Items")),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("sellers").doc(sharedPreferences!.getString("uid")).collection("menu").doc(widget.model!.menuID).collection("items").snapshots(),
            builder: (context,snapshot)
            {
              return !snapshot.hasData?
              SliverToBoxAdapter(
                child: Center(child: CircularProgressBar(),),
              )
                  : SliverStaggeredGrid.countBuilder(
                crossAxisCount: 1,
                staggeredTileBuilder: (c)=>StaggeredTile.fit(1),
                itemBuilder: (context,index)
                {
                  Items model=Items.fromJson(
                    snapshot.data!.docs[index].data()! as Map<String,dynamic>,
                  );
                  return ItemDesignWidget(model: model, context: context);

                },
                itemCount: snapshot.data!.docs.length,


              );

            },
          )

        ],
      ),

    );
  }
}
