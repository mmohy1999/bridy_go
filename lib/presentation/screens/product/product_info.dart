import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';


import '../../../business_logic/product_cubit/product_cubit.dart';
import '../../../constants/assets.dart';
import '../../../constants/my_colors.dart';
import '../../../data/models/product.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isExpanded2 = false;

    return BlocProvider(
      create: (BuildContext context) => ProductCubit()..getProductDetails(),
      child: BlocConsumer<ProductCubit, ProductState>(
          listener: (BuildContext context, ProductState state) {},
          builder: (BuildContext context, ProductState state) {
            ProductCubit _cubit= ProductCubit.get(context);
            Product product = _cubit.product;
            return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  iconTheme: const IconThemeData(color: Colors.white),
                  backgroundColor: Colors.transparent,
                ),
                body: state is! LoadingState
                    ? Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              product.images![0],
                              fit: BoxFit.cover,
                            ),
                          ),
                          // CarouselSlider(
                          //   options: CarouselOptions(height: 270.0),
                          //   items: carousel.map((i) {
                          //     return Builder(
                          //       builder: (BuildContext context) {
                          //         return Container(
                          //           width: MediaQuery.of(context).size.width,
                          //           margin: EdgeInsets.symmetric(horizontal: 5.0),
                          //           child: Container(
                          //             width: MediaQuery.of(context).size.width,
                          //             child: Image.asset(
                          //               widget.img,
                          //               fit: BoxFit.cover,
                          //             ),
                          //           ),
                          //         );
                          //       },
                          //     );
                          //   }).toList(),
                          // ),
                          Stack(
                            children: [
                              SingleChildScrollView(
                                child: FadedSlideAnimation(
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    margin: const EdgeInsets.only(
                                      top: 265,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Text(product.title,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Text(product.location,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2!
                                                  .copyWith(
                                                    fontSize: 10,
                                                  )),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
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
                                                (product.rate??0).toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .copyWith(
                                                        fontSize: 10,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              // Text(
                                              //   " (${product.reviewsCount} " +
                                              //       'reviews!' +
                                              //       ")",
                                              //   style: Theme.of(context)
                                              //       .textTheme
                                              //       .bodyText2!
                                              //       .copyWith(
                                              //           fontSize: 10,
                                              //           fontWeight:
                                              //               FontWeight.w500),
                                              // ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            children: [
                                              Text(
                                                "${product.price} L.E",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .copyWith(
                                                        fontSize: 12,
                                                        color: primaryColor,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        FadedScaleAnimation(
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      color: primaryAccent,
                                                      border: Border.all(
                                                          color: primaryColor,
                                                          width: 0.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  child: IconButton(
                                                    icon: Icon(
                                                      _cubit.bookmarkedIcon
                                                          ? Icons.bookmark
                                                          : Icons
                                                              .bookmark_border,
                                                      size: 18,
                                                      color: primaryColor,
                                                    ),
                                                    onPressed: () {
                                                      _cubit.onBookmarkTap(product.id);

                                                    },
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      _cubit.buyNow(product.variationId);
                                                    },
                                                    child: Container(
                                                      height: 50,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.72,
                                                      decoration: BoxDecoration(
                                                          color: primaryAccent,
                                                          border: Border.all(
                                                              color:
                                                                  primaryColor,
                                                              width: 0.5),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      30)),
                                                      child: Center(
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .account_balance_wallet_rounded,
                                                              color:
                                                                  primaryColor,
                                                              size: 18,
                                                            ),
                                                            const SizedBox(
                                                              width: 15,
                                                            ),
                                                            Text(
                                                              'buyNow',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyText1!
                                                                  .copyWith(
                                                                      color:
                                                                          primaryColor,
                                                                      fontSize:
                                                                          13.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      letterSpacing:
                                                                          0.5),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        // Padding(
                                        //   padding: const EdgeInsets.symmetric(horizontal: 20),
                                        //   child: Column(
                                        //     crossAxisAlignment: CrossAxisAlignment.start,
                                        //     children: [
                                        //       Text(
                                        //         locale.areaAvailable!,
                                        //         style: Theme.of(context)
                                        //             .textTheme
                                        //             .bodyText2!
                                        //             .copyWith(
                                        //                 fontSize: 12,
                                        //                 fontWeight: FontWeight.w500),
                                        //       ),
                                        //       SizedBox(
                                        //         height: 7,
                                        //       ),
                                        //       Row(
                                        //         children: [
                                        //           Column(
                                        //             crossAxisAlignment:
                                        //                 CrossAxisAlignment.start,
                                        //             children: [
                                        //               Text(
                                        //                 locale.mainHall!,
                                        //                 style: Theme.of(context)
                                        //                     .textTheme
                                        //                     .bodyText1!
                                        //                     .copyWith(
                                        //                         fontSize: 13.5,
                                        //                         fontWeight: FontWeight.w600),
                                        //               ),
                                        //               SizedBox(
                                        //                 height: 5,
                                        //               ),
                                        //               Text(
                                        //                   "800 " +
                                        //                       locale.seating! +
                                        //                       " | 1000 max.",
                                        //                   style: Theme.of(context)
                                        //                       .textTheme
                                        //                       .bodyText2!
                                        //                       .copyWith(
                                        //                           fontSize: 10,
                                        //                           fontWeight: FontWeight.w500)),
                                        //               SizedBox(
                                        //                 height: 10,
                                        //               ),
                                        //               Text(
                                        //                 locale.diningArea!,
                                        //                 style: Theme.of(context)
                                        //                     .textTheme
                                        //                     .bodyText1!
                                        //                     .copyWith(
                                        //                         fontSize: 13.5,
                                        //                         fontWeight: FontWeight.w600),
                                        //               ),
                                        //               SizedBox(
                                        //                 height: 5,
                                        //               ),
                                        //               Text(
                                        //                   "500 " +
                                        //                       locale.seating! +
                                        //                       " | 800 max.",
                                        //                   style: Theme.of(context)
                                        //                       .textTheme
                                        //                       .bodyText2!
                                        //                       .copyWith(
                                        //                           fontSize: 10,
                                        //                           fontWeight: FontWeight.w500))
                                        //             ],
                                        //           ),
                                        //           Spacer(),
                                        //           Column(
                                        //             crossAxisAlignment:
                                        //                 CrossAxisAlignment.start,
                                        //             children: [
                                        //               Text(
                                        //                 locale.conferenceHall!,
                                        //                 style: Theme.of(context)
                                        //                     .textTheme
                                        //                     .bodyText1!
                                        //                     .copyWith(
                                        //                         fontSize: 13.5,
                                        //                         fontWeight: FontWeight.w600),
                                        //               ),
                                        //               SizedBox(
                                        //                 height: 5,
                                        //               ),
                                        //               Text(
                                        //                   "100 " +
                                        //                       locale.seating! +
                                        //                       " | 120 max.",
                                        //                   style: Theme.of(context)
                                        //                       .textTheme
                                        //                       .bodyText2!
                                        //                       .copyWith(
                                        //                           fontSize: 10,
                                        //                           fontWeight: FontWeight.w500)),
                                        //               SizedBox(
                                        //                 height: 10,
                                        //               ),
                                        //               Text(
                                        //                 locale.garden!,
                                        //                 style: Theme.of(context)
                                        //                     .textTheme
                                        //                     .bodyText1!
                                        //                     .copyWith(
                                        //                         fontSize: 13.5,
                                        //                         fontWeight: FontWeight.w600),
                                        //               ),
                                        //               SizedBox(
                                        //                 height: 5,
                                        //               ),
                                        //               Text(
                                        //                   "1200 " +
                                        //                       locale.seating! +
                                        //                       " | 1500 max.",
                                        //                   style: Theme.of(context)
                                        //                       .textTheme
                                        //                       .bodyText2!
                                        //                       .copyWith(
                                        //                         fontSize: 10,
                                        //                         fontWeight: FontWeight.w500,
                                        //                       ))
                                        //             ],
                                        //           ),
                                        //           SizedBox(
                                        //             width: 20,
                                        //           )
                                        //         ],
                                        //       ),
                                        //       isExpanded1
                                        //           ? Padding(
                                        //               padding: const EdgeInsets.only(top: 10),
                                        //               child: Row(
                                        //                 children: [
                                        //                   Column(
                                        //                     crossAxisAlignment:
                                        //                         CrossAxisAlignment.start,
                                        //                     children: [
                                        //                       Text(
                                        //                         locale.mainHall!,
                                        //                         style: Theme.of(context)
                                        //                             .textTheme
                                        //                             .bodyText1!
                                        //                             .copyWith(
                                        //                                 fontSize: 13.5,
                                        //                                 fontWeight:
                                        //                                     FontWeight.w600),
                                        //                       ),
                                        //                       SizedBox(
                                        //                         height: 5,
                                        //                       ),
                                        //                       Text(
                                        //                           "800 " +
                                        //                               locale.seating! +
                                        //                               " | 1000 max.",
                                        //                           style: Theme.of(context)
                                        //                               .textTheme
                                        //                               .bodyText2!
                                        //                               .copyWith(
                                        //                                   fontSize: 10,
                                        //                                   fontWeight:
                                        //                                       FontWeight.w500)),
                                        //                       SizedBox(
                                        //                         height: 10,
                                        //                       ),
                                        //                       Text(
                                        //                         locale.diningArea!,
                                        //                         style: Theme.of(context)
                                        //                             .textTheme
                                        //                             .bodyText1!
                                        //                             .copyWith(
                                        //                                 fontSize: 13.5,
                                        //                                 fontWeight:
                                        //                                     FontWeight.w600),
                                        //                       ),
                                        //                       SizedBox(
                                        //                         height: 5,
                                        //                       ),
                                        //                       Text(
                                        //                           "500 " +
                                        //                               locale.seating! +
                                        //                               " | 800 max.",
                                        //                           style: Theme.of(context)
                                        //                               .textTheme
                                        //                               .bodyText2!
                                        //                               .copyWith(
                                        //                                   fontSize: 10,
                                        //                                   fontWeight:
                                        //                                       FontWeight.w500))
                                        //                     ],
                                        //                   ),
                                        //                   Spacer(),
                                        //                   Column(
                                        //                     crossAxisAlignment:
                                        //                         CrossAxisAlignment.start,
                                        //                     children: [
                                        //                       Text(
                                        //                         locale.conferenceHall!,
                                        //                         style: Theme.of(context)
                                        //                             .textTheme
                                        //                             .bodyText1!
                                        //                             .copyWith(
                                        //                                 fontSize: 13.5,
                                        //                                 fontWeight:
                                        //                                     FontWeight.w600),
                                        //                       ),
                                        //                       SizedBox(
                                        //                         height: 5,
                                        //                       ),
                                        //                       Text(
                                        //                           "100 " +
                                        //                               locale.seating! +
                                        //                               " | 120 max.",
                                        //                           style: Theme.of(context)
                                        //                               .textTheme
                                        //                               .bodyText2!
                                        //                               .copyWith(
                                        //                                   fontSize: 10,
                                        //                                   fontWeight:
                                        //                                       FontWeight.w500)),
                                        //                       SizedBox(
                                        //                         height: 10,
                                        //                       ),
                                        //                       Text(
                                        //                         locale.garden!,
                                        //                         style: Theme.of(context)
                                        //                             .textTheme
                                        //                             .bodyText1!
                                        //                             .copyWith(
                                        //                                 fontSize: 13.5,
                                        //                                 fontWeight:
                                        //                                     FontWeight.w600),
                                        //                       ),
                                        //                       SizedBox(
                                        //                         height: 5,
                                        //                       ),
                                        //                       Text(
                                        //                           "1200 " +
                                        //                               locale.seating! +
                                        //                               " | 1500 max.",
                                        //                           style: Theme.of(context)
                                        //                               .textTheme
                                        //                               .bodyText2!
                                        //                               .copyWith(
                                        //                                   fontSize: 10,
                                        //                                   fontWeight:
                                        //                                       FontWeight.w500))
                                        //                     ],
                                        //                   ),
                                        //                   SizedBox(
                                        //                     width: 20,
                                        //                   )
                                        //                 ],
                                        //               ),
                                        //             )
                                        //           : SizedBox.shrink(),
                                        //       GestureDetector(
                                        //         onTap: () {
                                        //           setState(() {
                                        //             isExpanded1 = !isExpanded1;
                                        //           });
                                        //         },
                                        //         child: Padding(
                                        //           padding: const EdgeInsets.only(top: 10),
                                        //           child: Row(
                                        //             children: [
                                        //               Text(locale.viewAll!,
                                        //                   style: Theme.of(context)
                                        //                       .textTheme
                                        //                       .bodyText2!
                                        //                       .copyWith(
                                        //                           fontSize: 12,
                                        //                           color: primaryColor,
                                        //                           fontWeight: FontWeight.w600)),
                                        //               Icon(
                                        //                 Icons.keyboard_arrow_down,
                                        //                 color: primaryColor,
                                        //                 size: 18,
                                        //               ),
                                        //             ],
                                        //           ),
                                        //         ),
                                        //       )
                                        //     ],
                                        //   ),
                                        // ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'details',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .copyWith(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Html(
                                               data:  product.details?? ' No Details For this Product',
                                              ),
                                              isExpanded2
                                                  ? Text(
                                                      'lorem',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .copyWith(
                                                            fontSize: 11,
                                                          ),
                                                    )
                                                  : const SizedBox.shrink(),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              // GestureDetector(
                                              //   onTap: () {
                                              //     setState(() {
                                              //       isExpanded2 = !isExpanded2;
                                              //     });
                                              //   },
                                              //   child: Row(
                                              //     children: [
                                              //       Text(locale.readMore!,
                                              //           style: Theme.of(context)
                                              //               .textTheme
                                              //               .bodyText2!
                                              //               .copyWith(
                                              //               fontSize: 12,
                                              //               color: primaryColor,
                                              //               fontWeight: FontWeight.w600)),
                                              //       Icon(
                                              //         Icons.keyboard_arrow_down,
                                              //         color: primaryColor,
                                              //         size: 18,
                                              //       ),
                                              //     ],
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Divider(
                                            height: 5,
                                            color:
                                                primaryColor.withOpacity(0.5),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'images',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .copyWith(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                height: 7,
                                              ),
                                              FadedSlideAnimation(
                                                GridView.builder(
                                                  padding: EdgeInsets.zero,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: 2,
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                    mainAxisExtent: 130,
                                                    crossAxisSpacing: 15,
                                                    mainAxisSpacing: 15,
                                                    crossAxisCount: 2,
                                                  ),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                       _cubit.goToAlbum(product.images!, context);
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Stack(
                                                          children: [
                                                            Container(
                                                              height: 150,
                                                              decoration: BoxDecoration(
                                                                  borderRadius: const BorderRadius
                                                                          .vertical(
                                                                      top: Radius
                                                                          .circular(
                                                                              8)),
                                                                  image: DecorationImage(
                                                                      image: NetworkImage(product
                                                                              .images![
                                                                          (index +
                                                                              1)]),
                                                                      fit: BoxFit
                                                                          .cover)),
                                                            ),
                                                            Container(
                                                              height: 150,
                                                              margin:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 10),
                                                              decoration:
                                                                  BoxDecoration(
                                                                gradient: LinearGradient(
                                                                    begin: Alignment
                                                                        .bottomCenter,
                                                                    end: Alignment.topCenter,
                                                                    colors: [
                                                                      Theme.of(
                                                                              context)
                                                                          .scaffoldBackgroundColor,
                                                                      Colors
                                                                          .white
                                                                          .withOpacity(
                                                                              0.1)
                                                                    ],
                                                                    stops: const [
                                                                      0.1,
                                                                      0.6
                                                                    ]),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                beginOffset:
                                                    const Offset(0.4, 0),
                                                endOffset: const Offset(0, 0),
                                                slideCurve:
                                                    Curves.linearToEaseOut,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  _cubit.goToAlbum(product.images!, context);
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10),
                                                  child: Row(
                                                    children: [
                                                      Text('viewAll',
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .bodyText2!
                                                              .copyWith(
                                                                  fontSize: 12,
                                                                  color:
                                                                      primaryColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
                                                      Icon(
                                                        Icons
                                                            .keyboard_arrow_down,
                                                        color: primaryColor,
                                                        size: 18,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Divider(
                                            height: 5,
                                            color:
                                                primaryColor.withOpacity(0.5),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Divider(
                                            height: 5,
                                            color:
                                                primaryColor.withOpacity(0.5),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'reviews',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2!
                                                        .copyWith(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                  ),
                                                  const Spacer(),
                                                  GestureDetector(
                                                    onTap: () {
                                                      // Navigator.push(
                                                      //     context,
                                                      //     MaterialPageRoute(
                                                      //         builder: (context) =>
                                                      //             AddReview(widget.model.title,widget.model.images[0],widget.model.category,widget.model.id)));
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.add,
                                                          color: primaryColor,
                                                          size: 18,
                                                        ),
                                                        Text('addReview',
                                                            style: Theme
                                                                    .of(context)
                                                                .textTheme
                                                                .bodyText2!
                                                                .copyWith(
                                                                    fontSize:
                                                                        12,
                                                                    color:
                                                                        primaryColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              product.reviewCount==0? const Center(child: Text('No Review Yet'),) :
                                              Column(
                                                children: [
                                                  ListTile(
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    leading: Container(
                                                      width: 40,
                                                      child: Image.network(_cubit.reviews[0].image),
                                                    ),
                                                    title: Text(
                                                      _cubit.reviews[0].name,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .copyWith(
                                                            fontSize: 13.5,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    subtitle: Row(
                                                      children: [
                                                        Text(
                                                          _cubit.reviews[0].time,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText2!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                        ),
                                                        const Spacer(),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.star,
                                                              color:
                                                                  primaryColor,
                                                              size: 12,
                                                            ),
                                                            const SizedBox(
                                                              width: 3,
                                                            ),
                                                            Text(
                                                              _cubit.reviews[0].rating,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyText2!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          9,
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    padding: const EdgeInsetsDirectional.only(start: 50),
                                                    child: Text(
                                                      _cubit.reviews[0].comment,
                                                      textAlign: TextAlign.start,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .copyWith(
                                                            fontSize: 11,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              product.reviewCount! >1? Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                child: Divider(
                                                  height: 5,
                                                  color: primaryColor
                                                      .withOpacity(0.5),
                                                ),
                                              ):Container(),
                                              product.reviewCount! >=2?Column(
                                                children: [
                                                  ListTile(
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    leading: Container(
                                                      width: 40,
                                                      child: Image.network(_cubit.reviews[1].image),
                                                    ),
                                                    title: Text(
                                                      _cubit.reviews[1].name,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .copyWith(
                                                            fontSize: 13.5,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    subtitle: Row(
                                                      children: [
                                                        Text(
                                                          _cubit.reviews[1].time,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText2!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                        ),
                                                        const Spacer(),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.star,
                                                              color:
                                                                  primaryColor,
                                                              size: 12,
                                                            ),
                                                            const SizedBox(
                                                              width: 3,
                                                            ),
                                                            Text(
                                                              _cubit.reviews[1].rating,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyText2!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          9,
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    padding: const EdgeInsetsDirectional.only(start: 50),
                                                    child: Text(
                                                      _cubit.reviews[1].comment,
                                                      textAlign: TextAlign.start,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .copyWith(
                                                            fontSize: 11,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ):Container(),
                                              product.reviewCount! >2?  GestureDetector(
                                                onTap: () {
                                                  // Navigator.push(
                                                  //     context,
                                                  //     MaterialPageRoute(
                                                  //         builder: (context) => Reviews()));
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10),
                                                  child: Row(
                                                    children: [
                                                      Text('viewAll',
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .bodyText2!
                                                              .copyWith(
                                                                  fontSize: 12,
                                                                  color:
                                                                      primaryColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
                                                      Icon(
                                                        Icons.chevron_right,
                                                        color: primaryColor,
                                                        size: 18,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ):Container()
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: primaryAccent,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            'sellerDetails',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .copyWith(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                        ),
                                        FadedSlideAnimation(
                                          GestureDetector(
                                            // onTap: () {
                                            //   Navigator.push(
                                            //       context,
                                            //       MaterialPageRoute(
                                            //           builder: (context) => VenueInfo(
                                            //               venueList[index].img,
                                            //               venueList[index].title)));
                                            // },
                                            child: Container(
                                              color: Colors.white,
                                              margin:
                                                  const EdgeInsetsDirectional
                                                      .only(top: 5, start: 20),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: Row(
                                                children: [
                                                  FadedScaleAnimation(
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      child: GestureDetector(
                                                        onTap: (){
                                                          _cubit.goToSellerProducts(product.sellerSlug!,product.sellerName!, context);
                                                        },
                                                        child: Container(
                                                          height: 95,
                                                          width: 115,
                                                          child: Image.network(
                                                            product.sellerImage!,
                                                            fit: BoxFit.cover,
                                                          ),
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
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    bottom: 50),
                                                            child: Text(
                                                                product
                                                                    .sellerName!,
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyText1!
                                                                    .copyWith(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    )),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          beginOffset: const Offset(0.4, 0),
                                          endOffset: const Offset(0, 0),
                                          slideCurve: Curves.linearToEaseOut,
                                        ),
                                      ],
                                    ),
                                  ),
                                  beginOffset: const Offset(0, 0.4),
                                  endOffset: const Offset(0, 0),
                                  slideCurve: Curves.linearToEaseOut,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ));
          }),
    );
  }
}
