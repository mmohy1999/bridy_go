import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/home_cubit/home_cubit.dart';
import '../../../constants/my_colors.dart';



class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<HomeCubit,HomeState>(
      listener:(BuildContext context,HomeState state){} ,
      builder: (BuildContext context,HomeState state){
        var _cubit=HomeCubit.get(context);
        var wishListData=_cubit.wishListProducts;
        return WillPopScope(
            onWillPop: () async{
              if(_cubit.homeData.isNotEmpty){
                _cubit.onBottomNavigationTap(0);
              }else{
                _cubit.getHomeData().then((value){
                  _cubit.onBottomNavigationTap(0);
                });
              }
          return false;
        }, child:_cubit.wishListProducts.isNotEmpty?  Container(

          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: FadedSlideAnimation(
            ListView.builder(
              shrinkWrap: true,
              itemCount: wishListData.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _cubit.goToProductInfo(wishListData[index].slug!, context);

                      },
                      child: Container(
                        color: Colors.white,
                        margin: const EdgeInsets.only(top: 5),
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            FadedScaleAnimation(
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  height: 93,
                                  width: 115,
                                  child: Image.network(
                                    wishListData[index].firstImageProduct!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              durationInMilliseconds: 500,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(wishListData[index].title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(wishListData[index].location,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                          fontSize: 10,
                                        )),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: primaryColor,
                                          size: 12,
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          wishListData[index].rate.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),

                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text('${wishListData[index].price} L.E' ,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                            fontSize: 12,
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      height: 5,
                      color: primaryColor.withOpacity(0.5),
                    )
                  ],
                );
              },
            ),
            beginOffset: const Offset(0.4, 0),
            endOffset: const Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
        )
            :const Center(child: Text('No Product To Show',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),),),
        );
      },
    );
  }
}
