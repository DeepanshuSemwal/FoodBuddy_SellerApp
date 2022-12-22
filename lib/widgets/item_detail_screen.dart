import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wow_food_seller/global/global.dart';
import 'package:wow_food_seller/models/items.dart';
import 'package:wow_food_seller/slash_screen/slash_screen.dart';
import 'package:wow_food_seller/widgets/simple_app_bar.dart';



class ItemDetailsScreen extends StatefulWidget
{
  final Items? model;
  ItemDetailsScreen({required this.model});

  @override
  _ItemDetailsScreenState createState() => _ItemDetailsScreenState();
}




class _ItemDetailsScreenState extends State<ItemDetailsScreen>
{
  TextEditingController counterTextEditingController = TextEditingController();


  deleteItem(String itemID)
  {
    FirebaseFirestore.instance
        .collection("sellers")
        .doc(sharedPreferences!.getString("uid"))
        .collection("menu")
        .doc(widget.model!.itemId!)
        .collection("items")
        .doc(itemID)
        .delete().then((value)
    {
      FirebaseFirestore.instance
          .collection("items")
          .doc(itemID)
          .delete();

      Navigator.push(context, MaterialPageRoute(builder: (c)=> const SlashScreen()));
      Fluttertoast.showToast(msg: "Item Deleted Successfully.");
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: SimpleAppBar(title: sharedPreferences!.getString("name"),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(widget.model!.thumbnail.toString()),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.model!.itemTitle.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.model!.itemDescription.toString(),
              textAlign: TextAlign.justify,
              style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${widget.model!.price}  ₹",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),

          const SizedBox(height: 10,),

          Center(
            child: InkWell(
              onTap: ()
              {
                //delete item
               deleteItem(widget.model!.itemId!);

              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: <Color>[Colors.red.shade800,Colors.green.shade700],
                      begin:FractionalOffset(0.0,0.0,),
                      end:FractionalOffset(1.0,0.0),
                      stops: [1.0,0.0],
                      tileMode: TileMode.clamp

                  ),

                ),

                width: MediaQuery.of(context).size.width - 13,
                height: 50,
                child: const Center(
                  child: Text(
                    "Delete this Item",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
