import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../business_logic/home_cubit/home_cubit.dart';
import '../../constants/assets.dart';
import '../../constants/my_colors.dart';
import '../../constants/strings.dart';

class HomeLayout extends StatelessWidget {
   const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context){
        if(navBottomCurrentIndex==3) {
          return HomeCubit()..getWishListProduct();
        }else if(navBottomCurrentIndex==4){
          return HomeCubit()..getCartData();
        }else if(navBottomCurrentIndex==5){
          return HomeCubit()..getMessages();

        }
        return HomeCubit()..getHomeData();
      },
      child: BlocConsumer<HomeCubit,HomeState>(
        listener: (BuildContext context,HomeState state){},
        builder:(BuildContext context,HomeState state){
          HomeCubit _cubit =HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,

              title: Text('Bridy Go',style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(
                  fontSize: 20, color: primaryColor),),
              actions: [
                IconButton(
                    icon: Icon(
                      FontAwesomeIcons.blog,
                      color: primaryColor,
                      size: 20,
                    ),
                    onPressed: () {
                      print('blog');
                    }),
                IconButton(
                    icon: Icon(
                      Icons.person,
                      color: primaryColor,
                      size: 20,
                    ),
                    onPressed: () {
                      _cubit.goToMorePage(context);
                    }),

              ],
              titleSpacing: 20,
            ),
            body:state is !LoadingHomeState? _cubit.screens[navBottomCurrentIndex]
                :const Center(child: CircularProgressIndicator()),
            bottomNavigationBar: BottomNavigationBar(
              iconSize: 18,
              currentIndex:navBottomCurrentIndex,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              backgroundColor: Colors.white,
              elevation: 10,
              selectedLabelStyle:
              Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 10),
              unselectedLabelStyle:
              Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 10,),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Theme.of(context).primaryColor,
              unselectedItemColor: Theme.of(context).hintColor,
              onTap: _cubit.onBottomNavigationTap,
              items: const [
                BottomNavigationBarItem(
                    activeIcon: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ImageIcon(AssetImage(Assets.iconHome))),
                    icon: Opacity(
                      opacity: 0.5,
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ImageIcon(AssetImage(Assets.iconHome))),
                    ),
                    label: 'home'),
                BottomNavigationBarItem(
                    activeIcon: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ImageIcon(AssetImage(Assets.iconVendor))),
                    icon: Opacity(
                      opacity: 0.5,
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ImageIcon(AssetImage(Assets.iconVendor))),
                    ),
                    label: 'categories'),
                BottomNavigationBarItem(
                    activeIcon: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.chat)),
                    icon: Opacity(
                      opacity: 0.5,
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.chat)),
                    ),
                    label: 'chat'),
                BottomNavigationBarItem(
                    activeIcon: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.favorite)),
                    icon: Opacity(
                      opacity: 0.5,
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child:Icon(Icons.favorite)),
                    ),
                    label: 'wishList'),
                BottomNavigationBarItem(
                    activeIcon: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.shopping_cart)),
                    icon: Opacity(
                      opacity: 0.5,
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child:Icon(Icons.shopping_cart)),
                    ),
                    label: 'cart'),

              ],
              //onTap: onTap,
            ),
          );
        },
      ),
    );
  }
}
