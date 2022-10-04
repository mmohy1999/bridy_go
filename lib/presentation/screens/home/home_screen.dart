import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import 'package:bridy_go_user/constants/strings.dart';
import 'package:bridy_go_user/presentation/screens/home/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/home_cubit/home_cubit.dart';
import '../../../constants/my_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (BuildContext context, HomeState state) {},
      builder: (BuildContext context, HomeState state) {
        var _cubit = HomeCubit.get(context);
        var homeData = _cubit.homeData;
        return homeData.isNotEmpty
            ? Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'hey, ${mUser.name}',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: primaryAccent,
                                borderRadius: BorderRadius.circular(30)),
                            child: IconButton(
                                icon: Icon(
                                  Icons.search,
                                  color: primaryColor,
                                  size: 20,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SearchScreen()));
                                }),
                          )
                        ],
                      ),
                    ),
                    FadedSlideAnimation(
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 15,
                                crossAxisCount: 3,
                                mainAxisExtent: 100),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              _cubit.categoryClick(index, context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            const BorderRadius.vertical(
                                                top: Radius.circular(8)),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                homeData[index].category.image),
                                            fit: BoxFit.cover)),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      gradient: LinearGradient(
                                        // begin: Alignment.bottomCenter,
                                        // end: Alignment.topCenter,
                                        colors: [
                                          Colors.white,
                                          Colors.white.withOpacity(0.1),
                                        ],
                                        end: const Alignment(0.0, -0.0),
                                        begin: const Alignment(0.0, 0.8),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                        (index == 5)
                                            ? '+${homeData.length - 5} more'
                                            : homeData[index].category.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                fontSize: 10,
                                                color: index == 5
                                                    ? primaryColor
                                                    : const Color(0xff4d4d4d),
                                                fontWeight: FontWeight.w600)),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      beginOffset: const Offset(0.4, 0),
                      endOffset: const Offset(0, 0),
                      slideCurve: Curves.linearToEaseOut,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: homeData.length * 212,
                      child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index1) => Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    homeData[index1].category.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 142,
                                    child: FadedSlideAnimation(
                                      ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount:
                                            homeData[index1].products.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return GestureDetector(
                                            onTap: () {
                                              _cubit.goToProductInfo(homeData[index1].products[index].slug!, context);
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  right: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Stack(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        child: SizedBox(
                                                          width: 120,
                                                          child: Image.network(
                                                            homeData[index1]
                                                                .products[index]
                                                                .firstImageProduct!,
                                                            fit: BoxFit.cover,
                                                            width: 120,
                                                            height: 115,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 110,
                                                        width: 120,
                                                        // margin: EdgeInsets.only(top: 10),
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                            end:
                                                                const Alignment(
                                                                    0.0, 0.0),
                                                            begin:
                                                                const Alignment(
                                                                    0.0, 0.8),
                                                            colors: [
                                                              Colors.white,
                                                              Colors.white
                                                                  .withOpacity(
                                                                      0.1)
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: Text(
                                                            homeData[index1].products[index].title.length <= 20 ?
                                                            homeData[index1].products[index].title
                                                                : homeData[index1].products[index].title.substring(0, 20) + '..',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyText1!
                                                                .copyWith(
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)),
                                                      )
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10, top: 2),
                                                    child: Text(
                                                      homeData[index1]
                                                          .products[index]
                                                          .location,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2!
                                                          .copyWith(
                                                              fontSize: 10),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10, top: 2),
                                                    child: Text(
                                                      homeData[index1]
                                                          .products[index]
                                                          .price
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2!
                                                          .copyWith(
                                                              fontSize: 9.5,
                                                              color:
                                                                  primaryColor),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      beginOffset: const Offset(0.4, 0),
                                      endOffset: const Offset(0, 0),
                                      slideCurve: Curves.linearToEaseOut,
                                    ),
                                  ),
                                ],
                              ),
                          separatorBuilder: (_, __) => const SizedBox(
                                height: 40,
                              ),
                          itemCount: homeData.length),
                    ),
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
