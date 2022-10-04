import '../../constants/strings.dart';

class Category{
  late int id;
  late String title,image,slug;

  Category(this.id, this.title, this.image);

  Category.fromJson(Map<String,dynamic> json){
    id=json['id'];
    title=json['name'];
    image=json['image'];
    slug=json['slug'];
  }
  @override
  String toString() {
    // TODO: implement toString
    return 'id:$id, title:$title, image:$image \n';
  }
}