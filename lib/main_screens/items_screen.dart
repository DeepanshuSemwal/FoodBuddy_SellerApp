import 'package:flutter/material.dart';
import 'package:wow_food_seller/upload_screens/upload_item_screen.dart';
import 'package:wow_food_seller/widgets/text_widget_header.dart';

import '../global/global.dart';
import '../models/menus.dart';
import '../upload_screens/upload_menu_screen.dart';
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
          SliverPersistentHeader(delegate: TextWidgetHeader(title: widget.model!.menuTitle.toString() + " Items"))
        ],
      ),

    );
  }
}
