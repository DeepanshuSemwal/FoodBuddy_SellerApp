class Items
{
  String?itemDescriptions;
  String?itemId;
  String?itemInfo;
  String?itemTitle;
  int?price;
  String?published;
  String?sellerName;
  String?sellerId;
  String?thumbnail;
  Items({

   this.itemDescriptions,
    this.itemId,
    this.itemInfo,
   this.itemTitle,
    this.price,
    this.published,
    this.sellerName,
    this.sellerId,
    this.thumbnail
});

  Items.fromJson(Map<String,dynamic> json)
  {
    final Map<String,dynamic>data=Map<String,dynamic>();
    itemDescriptions=data["itemDescription"];
    itemId=data["itemId"];
    itemInfo=data["itemInfo"];
    itemTitle=data["itemTitle"];
    price=data["price"];
    published=data["published"];
    sellerName=data["sellerName"];
    sellerId=data["sellerId"];
    thumbnail=data["thumbnail"];

  }
  Map<String,dynamic> toJson()
  {
    final Map<String,dynamic> data=new Map<String,dynamic>();
    data["itemDescription"]=itemDescriptions;
    data["itemId"]=itemId;
    data["itemInfo"]=itemInfo;
    data["itemTitle"]=itemTitle;
    data["price"]=price;
    data["published"]=published;
    data["sellerName"]=sellerName;
    data["sellerId"]=sellerId;
   data["thumbnail"]= thumbnail;
    return data;

  }


}