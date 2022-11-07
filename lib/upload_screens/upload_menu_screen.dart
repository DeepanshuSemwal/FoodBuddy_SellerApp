import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart%20';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wow_food_seller/global/global.dart';
import 'package:wow_food_seller/widgets/alert_dialog.dart';
import 'package:wow_food_seller/widgets/progress_bar.dart';
//import 'package:firebase_storage/firebase_storage.dart';



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
  bool uploading=false;
  String uniqueIdName=DateTime.now().microsecondsSinceEpoch.toString();

  @override
  Widget build(BuildContext context) {

    return imageXFile==null?selectMenuScreen():MenuUploadScreen();
  }

  takeImage(context)
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

                uploading ?null:uploadingValidateForm();
        },
              child: Text("Add",
              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
              ),

      ),
        ],

      ),
      body: ListView(
        children: [

         Container(
          child: uploading==true?linearProgressBar():Text(""),
         ),

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

  // 1. select menu and after that 2. upload menu
  selectMenuScreen()
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

                  takeImage(context);

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
  uploadingValidateForm()async
  {
    if(imageXFile!=null)
      {
        if(menuInfoController.text.isNotEmpty && titleEditingController.text.isNotEmpty)
          {
            setState(
                    ()
                {
                  uploading=true;
                }
            );
            //upload image
           // String downloadUrl=await uploadImage(File(imageXFile!.path));

          // save info to firebase
           //safeInfo(downloadUrl);



          }
        else
          {
            showDialog(context: context,
                builder: (c)
                {
                  return ErrorDialog(message: "Please write title and information for menu");
                }

            );

          }

      }
    else
      {
            showDialog(context: context,
                builder: (c)
                {
                  return ErrorDialog(message: "Please Select an image for menu");
                }

            );
      }
  }

  Future uploadImage(mImageFile) async
  {

    try
        {
                // menus folder has been created
          Reference reference =FirebaseStorage
              .instance
              .ref()
              .child("menus");
          UploadTask uploadTask = reference.child(uniqueIdName + ".jpg").putFile(mImageFile) ;

         // reference.TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {}) ;

          // String downloadURL = await taskSnapshot.ref.getDownloadURL();

           final UploadTask task = reference.putFile(mImageFile);

         // var downloadURL = await (await task.onComplete).ref.getDownloadURL();
        var downloadURL =  await (await uploadTask).ref.getDownloadURL().toString();



          return downloadURL;

        }
        catch(error)
    {
      print(error);
    }


  }



safeInfo(String downloadUrl)
{
  final ref=FirebaseFirestore.instance.collection("sellers")
      .doc(sharedPreferences!.getString("uid"))
      .collection("menu");
  ref.doc(uniqueIdName).set({

    "menuId":uniqueIdName,
    "sellersId": sharedPreferences!.getString("uid"),
    "menuTitle": titleEditingController.text.toString(),
    "menuInfo": menuInfoController.text.toString(),
    "published":DateTime.now(),
    "status": "available",
    "thumbnail":downloadUrl,

  });
  clearMenuUploadingForm();
  setState(() {
    uniqueIdName=DateTime.now().toString();
    uploading=false;

  });


}
  clearMenuUploadingForm()
  {
      setState(() {
        menuInfoController.clear();
        titleEditingController.clear();
        imageXFile=null;
      });
  }






}

