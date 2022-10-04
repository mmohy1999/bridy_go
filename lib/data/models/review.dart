class Review{
  late String name,image,rating,comment,time;
  Review.fromJson(Map<String,dynamic> json){
    name=json['user']['name'];
    image=json['user']['avatar'];
    rating=json['rating'];
    comment=json['comment'];
    time=json['time'];
  }
}