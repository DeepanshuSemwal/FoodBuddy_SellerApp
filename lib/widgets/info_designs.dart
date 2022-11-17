import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wow_food_seller/global/global.dart';
import 'package:wow_food_seller/main_screens/items_screen.dart';

//import '../models/menus.dart';
import 'package:wow_food_seller/models/menus.dart';
import 'package:fluttertoast/fluttertoast.dart';



class InfoDesignWidget extends StatefulWidget
{
  Menus? model;
  BuildContext? context;

  InfoDesignWidget({required this.model, required this.context});

  @override
  _InfoDesignWidgetState createState() => _InfoDesignWidgetState();
}



class _InfoDesignWidgetState extends State<InfoDesignWidget> {


  delete(String menuID)
  {
    FirebaseFirestore.instance.collection("sellers").doc(sharedPreferences!.getString("uid")).collection("menu").doc(menuID).delete();
   Fluttertoast.showToast(msg: "Menu Deleted",
   );

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (c)=>ItemsScreen(model: widget.model,)));
      },
      splashColor: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 300,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.model!.menuTitle!,
                    style: const TextStyle(
                      color: Colors.redAccent,
                      fontSize: 20,
                      // fontFamily: "dancingScript",
                    ),
                  ),
                  IconButton
                    (
                      onPressed: ()
                      {
                        delete(widget.model!.menuID!);

                      },

                      icon: Icon(Icons.delete,
                      color: Colors.red,
                      ),
                  ),
                ],
              ),
              Text(
                widget.model!.menuInfo!,
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