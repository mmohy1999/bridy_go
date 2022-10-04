import '../../constants/strings.dart';

class User{
  late String email,password;
  late String name,phone,profileImg,token;
  late int id;
  User.initial();

  //login
  User.login({required this.email, required this.password});
  //register
  User.register({required this.email, required this.password, required this.name,required this.phone});

  User.fromJson(Map<String,dynamic> json){
    id=json['user']['id'];
    email=json['user']['email'];
    name=json['user']['name'];
    phone=json['user']['phone'];
    token=json['access_token'];
    profileImg=json['user']['avatar']!=""?json['user']['avatar']:'https://bridygo.online/public/assets/img/placeholder.jpg';
  }

  @override
  String toString() {
    //profile: $profileImg\nrole: $role
    return 'email: $email\name: $name\nphone: $phone\n';
  }

}