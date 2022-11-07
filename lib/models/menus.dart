import 'package:cloud_firestore/cloud_firestore.dart';

class Menus
{
  String? menuID;
  String? sellerUID;
  String? menuTitle;
  String? menuInfo;
  Timestamp? publishedDate;
  String? thumbnail;
  String? status;

 Menus({
    this.menuID,
   this.sellerUID,
   this.menuTitle,
   this.menuInfo,
   this.publishedDate,
   this.thumbnail,
   this.status
});
 Menus.fromJson(Map<String,dynamic> json)
 {
   menuID=json["menuID"];
   sellerUID=json["sellerUID"];
   menuTitle=json["menuTitle"];
   menuInfo=json["menuInfo"];
   publishedDate=json["thumbnailUrl"];
   status=json["status"];
 }
 Map<String,dynamic> toJson()
 {
   final Map<String,dynamic> data=Map<String,dynamic>();
   data["menuID"]=menuID;
   data["sellerId"]=sellerUID;
   data["menuTitle"]=menuTitle;
   data["menuInfo"]=menuInfo;
   data["publishedData"]=publishedDate;
   data["status"]=status;
   return data;
 }

}