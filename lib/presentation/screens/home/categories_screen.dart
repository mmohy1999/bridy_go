import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/home_cubit/home_cubit.dart';
import '../../../constants/my_colors.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
    listener:(BuildContext context,HomeState state){} ,
    builder:(BuildContext context,HomeState state){
      var _cubit=HomeCubit.get(context);
      var categoriesData=_cubit.homeData;
      return WillPopScope(
        onWillPop: () async{
          _cubit.onBottomNavigationTap(0);
          return false;
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: FadedSlideAnimation(
            ListView.builder(
              padding: const EdgeInsets.only(bottom: 40),
              shrinkWrap: true,
              itemCount: categoriesData.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _cubit.goToProductsScreen(categoriesData[index].category.slug,categoriesData[index].category.title, context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: primaryAccent),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 10, bottom: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        categoriesData[index].category.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              // Spacer(),
                              Stack(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: Image.network( categoriesData[index].category.image),
                                  ),
                                  Container(
                                    height: 78,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        end: const Alignment(0.0, 0.0),
                                        begin: const Alignment(-0.8, 0.0),
                                        colors: [
                                          primaryAccent,
                                          Colors.white.withOpacity(0.1)
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            beginOffset: const Offset(0.4, 0),
            endOffset: const Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
        ),
      );
    }
    );
  }
}
