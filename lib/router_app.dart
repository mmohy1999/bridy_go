
import 'package:bridy_go_user/presentation/layouts/home_layout.dart';
import 'package:bridy_go_user/presentation/screens/Account/change_language.dart';
import 'package:bridy_go_user/presentation/screens/auth/login_screen.dart';
import 'package:bridy_go_user/presentation/screens/auth/verification.dart';
import 'package:bridy_go_user/presentation/screens/product/product_info.dart';
import 'package:bridy_go_user/presentation/screens/product/product_list_screen.dart';
import 'package:bridy_go_user/presentation/screens/auth/register_screen.dart';
import 'package:flutter/material.dart';

import 'constants/strings.dart';

class AppRouter{
  Route? generateRoute(RouteSettings settings){
    switch(settings.name){
      case loginScreen:
       return MaterialPageRoute(builder: (_) =>const LoginScreen());
      case registerScreen:
        return MaterialPageRoute(builder: (_)=> const RegisterScreen());
      case  homeScreen:
        return MaterialPageRoute(builder: (_)=> const HomeLayout());
      case  listProductsScreen:
        return MaterialPageRoute(builder: (_)=> ProductListScreen());
      case productScreen:
        return MaterialPageRoute(builder: (_)=>const ProductInfo());
      case verifyScreen:
        return MaterialPageRoute(builder: (_)=> const VerificationScreen());

    }
    return null;
  }
}