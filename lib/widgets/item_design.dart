import 'package:flutter/material.dart';
import 'package:wow_food_seller/main_screens/items_screen.dart';
import 'package:wow_food_seller/models/items.dart';

//import '../models/menus.dart';
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
       // Navigator.push(context, MaterialPageRoute(builder: (c)=>ItemsScreen(model: widget.model,)));
      },
      splashColor: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 280,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Divider(
                height: 4,
                thickness: 3,
                color: Colors.grey[300],
              ),
              Image.network(
                widget.model!.thumbnail!,
                height: 220.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 1.0,),
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
                height: 4,
                thickness: 3,
                color: Colors.grey[300],
              ),
              Text(
                widget.model!.itemDescriptions!,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              Divider(
                height: 4,
                thickness: 3,
                color: Colors.grey[300],
              ),

            ],
          ),
        ),
      ),
    );
  }
}