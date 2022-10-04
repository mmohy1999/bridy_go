import 'package:bridy_go_user/data/models/category.dart';
import 'package:bridy_go_user/data/models/product.dart';

class HomeModel{
  late Category category;
  late List<Product> products=[];

  HomeModel.fromJson(Map<String,dynamic> json){
  category=Category.fromJson(json);
  json['products'].forEach((model){
     products.add(Product.fromJson(model));
   });
  }

  @override
  String toString() {
    // TODO: implement toString
    return '${category.toString()}\n firstproduct:${products.length}';
  }

}