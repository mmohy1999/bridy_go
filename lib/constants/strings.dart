import 'package:bridy_go_user/data/models/user.dart';

const String baseURl='https://bridygo.online/api/v1';
const String loginScreen='/';
const String registerScreen='/register';
const String homeScreen='/home';
const String verifyScreen='/verify';
const String listProductsScreen='/products';
const String productScreen='/productInfo';


String? mEmail;
String? appLang;
String categorySlug='';
String productSlug='';
String sellerSlug='';
int navBottomCurrentIndex=0;
String titleListScreen='';
String flagListScreen= '';

User mUser =User.initial();