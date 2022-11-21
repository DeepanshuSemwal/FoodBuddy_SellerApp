import 'package:flutter/material.dart';
import 'package:wow_food_seller/main_screens/items_screen.dart';
import 'package:wow_food_seller/models/items.dart';
import 'package:wow_food_seller/upload_screens/upload_item_screen.dart';
import 'package:wow_food_seller/upload_screens/upload_item_screen_itemScreen.dart';
import 'package:wow_food_seller/widgets/item_detail_screen.dart';
import '../models/menus.dart';
import 'package:wow_food_seller/models/menus.dart';



class ItemDesignWidget extends StatefulWidget
{
   Items? model;
  BuildContext? context;

  ItemDesignWidget({required this.model, required this.context});

  @override
  _ItemDesignWidgetState createState() => _ItemDesignWidgetState();
}



class _ItemDesignWidgetState extends State<ItemDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        // Navigator.push(context, MaterialPageRoute(builder: (c)=>ItemUploadScreen_itemScreen(model: widget.model)));
        Navigator.push(context, MaterialPageRoute(builder: (c)=>ItemDetailsScreen(model: widget.model,)));


      },
      splashColor: Colors.red,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 280,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Divider(
                        height: 5,
                        thickness: 4,
                        color: Colors.grey[300],
                      ),
                      Image.network(
                        widget.model!.thumbnail!,
                        height: 220.0,
                        fit: BoxFit.cover,
                      ),

                      const SizedBox(height: 10.0,),



                      Text(

                        widget.model!.itemTitle!,
                        style: const TextStyle(
                          color: Colors.redAccent,
                          fontSize: 20,
                          // fontFamily: "dancingScript",
                        ),
                      ),
                      Text(
                        widget.model!.itemInfo!,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      Divider(
                        height:5,
                        thickness: 4,
                        color: Colors.grey[300],
                      ),
                      Text(
                        widget.model!.itemDescription!,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      Divider(
                        height: 5,
                        thickness: 4,
                        color: Colors.grey[300],
                      ),

                    ],
                  ),
                ),
              ),

          ),
        ),



    );
  }
}






