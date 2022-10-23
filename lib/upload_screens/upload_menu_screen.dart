


import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {

  XFile ?imageXFile;
  final ImagePicker _imagePicker=ImagePicker();
  TextEditingController menuInfoController=TextEditingController();
  TextEditingController titleEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {

    return imageXFile==null?MenuAddScreen():MenuUploadScreen();
  }

  uploadImage(context)
  {
    return showDialog(context: context,

        builder: (context)
        {
          return SimpleDialog(
            title: Text("Select an option",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),

            ),
           children: [

             SimpleDialogOption(
               child: Text("Capture image from camera",
                 style: TextStyle(color: Colors.red,
                   fontWeight: FontWeight.bold,
                 ),

               ),
               onPressed: ()
               {

                       CaptureImageFromCamera();

               },
             ),

             SimpleDialogOption(
               child: Text("Take image from gallery",
                 style: TextStyle(color: Colors.red,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               onPressed: ()
               {
                   TakeImageFromGallery();

               },
             ),


             SimpleDialogOption(
               child: Text("Cancel",
                 style: TextStyle(color: Colors.red,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               onPressed: ()
               {
                 Navigator.pop(context);

               },
             ),

           ],

          );
        }

    );
  }
  CaptureImageFromCamera() async
  {
    Navigator.pop(context);
    imageXFile=await _imagePicker.pickImage(source: ImageSource.camera,
      maxHeight: 720,
      maxWidth: 1280,
    );
    setState((){
      imageXFile;
    });

  }
  TakeImageFromGallery() async
  {
    Navigator.pop(context);
    imageXFile=await _imagePicker.pickImage(source: ImageSource.gallery,
      maxHeight: 720,
      maxWidth: 1280,
    );
    setState((){
      imageXFile;
    });
  }

  MenuUploadScreen()
  {
    return Scaffold(

      appBar: AppBar(
        title: Text("Upload Menu",
          style: TextStyle(
            fontFamily: "DancingScript-Bold",
            color: Colors.white,

          ),
        ),

        automaticallyImplyLeading: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[Colors.red.shade800,Colors.green.shade700],
              begin:FractionalOffset(0.0,0.0,),
              end:FractionalOffset(1.0,0.0),
              stops: [1.0,0.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,),
          color: Colors.white,

          onPressed: ()
          {

          },

        ),
        actions: [
          TextButton(
              onPressed: ()
        {

        },
              child: Text("Add",
              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
              )

      ),
        ],

      ),
      body: ListView(
        children: [
          Container(
            height: 230,
            width: MediaQuery.of(context).size.width*0.11,
            child: Center(
              child: AspectRatio(
                aspectRatio: 16/9,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(File(imageXFile!.path),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),


            ),

          ),
          SizedBox(height: 10,),

          ListTile(
            leading: Icon(Icons.title_outlined,color: Colors.black,),
            title: Container(
              width: 255,
              child: TextField(
                style: TextStyle(color: Colors.black),
                controller: titleEditingController,
                decoration: InputDecoration(
                  hintText: "Menu Title",
                  hintStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 10,left: 10,right: 10),
            child: Divider(
              color: Colors.black,
              thickness: 2,
            ),
          ),
           ListTile(
            leading: Icon(Icons.perm_device_info_outlined,color: Colors.black,),
            title: Container(
              width: 255,
              child: TextField(
                style: TextStyle(color: Colors.black),
                controller: menuInfoController,
                decoration: InputDecoration(
                  hintText: "Menu Info",
                  hintStyle: TextStyle(color: Colors.black),

                ),
              ),
            ),
          ),

        ],
      ),


    );
  }

  MenuAddScreen()
  {
    return Scaffold(

      appBar: AppBar(
        title: Text("Add New Menu",
          style: TextStyle(
            fontFamily: "DancingScript-Bold",
            color: Colors.white,

          ),
        ),

        automaticallyImplyLeading: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[Colors.red.shade800,Colors.green.shade700],
              begin:FractionalOffset(0.0,0.0,),
              end:FractionalOffset(1.0,0.0),
              stops: [1.0,0.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        centerTitle: true,

      ),
      body: Container(
        child: Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Icon(Icons.shop_two_outlined,
                color: Colors.black38,
                size: 200,
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                onPressed: ()
                {
                  uploadImage(context);

                },
                child: Text("Add New Menu",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),

                ),

                style: ElevatedButton.styleFrom(
                  primary: Colors.red.shade500,
                  padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),


                ),
              ),
            ],

          ),
        ),
      ),


    );
  }





}

