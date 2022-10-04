
import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import 'package:bridy_go_user/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/product_cubit/product_cubit.dart';
import '../../../constants/my_colors.dart';
import '../../../data/models/product.dart';

//ignore: must_be_immutable
class ProductListScreen extends StatelessWidget {
    const ProductListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context){
          if(flagListScreen=='category') {
            return ProductCubit()..getProductsByCategory();
          } else if(flagListScreen=='seller') {
            return ProductCubit()..getProductsBySeller();
          }else{
            return ProductCubit()..getProductsBySearch();
          }

        },
        child: BlocConsumer<ProductCubit,ProductState>(
        listener: (BuildContext context,ProductState state){
        },
          builder:(BuildContext context,ProductState state){
            ProductCubit _cubit =ProductCubit.get(context);

           List<Product> products=_cubit.products;
            return Scaffold(
              appBar: AppBar(
                elevation: 1,
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,

                title: Text(titleListScreen,style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(
                    fontSize: 20, color: primaryColor),),
                actions: [
                  IconButton(
                      icon: Icon(
                        Icons.search_rounded,
                        color: primaryColor,
                        size: 20,
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //     context, MaterialPageRoute(builder: (context) => Search()));
                      }),
                ],
                titleSpacing: 20,
              ),

              body: state is !LoadingState || _cubit.products!=[]? Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: FadedSlideAnimation(
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _cubit.goToProductInfo(products[index].slug!, context);

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
                                      child: SizedBox(
                                        height: 93,
                                        width: 115,
                                        child: Image.network(products[index].firstImageProduct!
                                          ,
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
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(products[index].title,
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
                                        Text(products[index].location,
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
                                              products[index].rate.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            // Text(
                                            //   products[index].reviewsCount.toString(),
                                            //   style: Theme.of(context)
                                            //       .textTheme
                                            //       .bodyText2!
                                            //       .copyWith(
                                            //       fontSize: 9,
                                            //       fontWeight: FontWeight.w500),
                                            // ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(products[index].price.toString() ,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .copyWith(
                                                fontSize: 12,
                                                color: primaryColor,
                                                fontWeight: FontWeight.bold))
                                      ],
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
              ):const Center(child: CircularProgressIndicator()) ,
            );
        }
         )
    );
}
}
