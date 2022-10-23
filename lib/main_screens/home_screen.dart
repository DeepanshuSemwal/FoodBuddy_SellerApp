import 'package:flutter/material.dart';
import 'package:wow_food_seller/authentication/auth_screen.dart';
import 'package:wow_food_seller/global/global.dart';
import 'package:wow_food_seller/upload_screens/upload_menu_screen.dart';
import 'package:wow_food_seller/widgets/custum_drawer.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustumDrawer(),

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
                  Navigator.push(context,MaterialPageRoute(builder: (c)=>UploadScreen()));
              },

          ),
        ],

      ),

      body: Center(


      ),
    );
  }
}
