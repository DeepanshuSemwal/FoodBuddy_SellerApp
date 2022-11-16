import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
//import 'package:wow_food_seller/authentication/auth_screen.dart';
import 'package:wow_food_seller/global/global.dart';
import 'package:wow_food_seller/models/menus.dart';
import 'package:wow_food_seller/upload_screens/upload_menu_screen.dart';
import 'package:wow_food_seller/widgets/custum_drawer.dart';
import 'package:wow_food_seller/widgets/info_designs.dart';
//import '../widgets/progress_bar.dart';
import 'package:wow_food_seller/widgets/progress_bar.dart';
import 'package:wow_food_seller/widgets/text_widget_header.dart';


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
                  Navigator.push(context,MaterialPageRoute(builder: (c)=>UploadScreenMenu()));
              },

          ),
        ],

      ),

      body: CustomScrollView(

        slivers: [
          SliverPersistentHeader(pinned:true,delegate: TextWidgetHeader(title: "My Menus")),

          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("sellers").doc(sharedPreferences!.getString("uid")).collection("menu").orderBy("published",descending: true).snapshots(),
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
                  Menus model=Menus.fromJson(
                    snapshot.data!.docs[index].data()! as Map<String,dynamic>,
                  );
                  return InfoDesignWidget
                    (model: model, context: context);
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
