
class Product{
  late int id,price;
  late int? rate,sellerId,reviewCount;
  late dynamic variationId;
  late String title,location;
  late String? firstImageProduct,details,sellerName,sellerImage,slug,sellerSlug;
  late bool? isSaved;
  late List<String>? images=[];
  Product.initial();
  Product.horizontal({required this.id, required this.title, required this.firstImageProduct, required this.location, required this.price});


  Product.vertical(this.id, this.rate, this.title,
      this.firstImageProduct, this.location, this.price);



  Product.fromJson(Map<String,dynamic> json){
    slug=json['slug'];
    id = json['id'];
    title=json['name'];
    firstImageProduct=json['thumbnail_image'];
    location=json['shop']?['name']??'cairo';
    price=json['base_price'];
    rate=json['review_summary']?['average'];
    reviewCount=json['review_summary']?['total_count'];
    details=json['description'];
    isSaved=json['is_saved']??false;
    sellerName=json['shop']?['name'];
    sellerImage=json['shop']?['logo'];
   // sellerId=json['shop']?['id']??2;
    sellerSlug=json['shop']?['slug'];
    variationId=json['variations'].length !=0? json['variations'][0]['id']:0;
    json['photos']?.forEach((model){
      images!.add(model);
    });

  }

  @override
  String toString() {
    // TODO: implement toString
    return 'id:$id,title:$title, price:$price';
  }
}