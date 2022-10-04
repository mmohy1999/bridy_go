import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/home_cubit/home_cubit.dart';
import '../../../constants/my_colors.dart';

// ignore: must_be_immutable
class CartScreen extends StatelessWidget {
  int totalPrice=0,index=0;
  CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
        listener:(BuildContext context,HomeState state){} ,
        builder:(BuildContext context,HomeState state){
          totalPrice=0;
          index=0;
          var _cubit=HomeCubit.get(context);

          return WillPopScope(
              onWillPop: () async{
            _cubit.onBottomNavigationTap(0);
            return false;
          },
          child: _cubit.cartList.isNotEmpty?
          SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: getChildrenWithSeperator(
                      addToLastChild: false,
                      widgets: _cubit.cartList.map((e) {
                        totalPrice+=e.price;
                        e.index=index;
                        index++;
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                          ),
                          width: double.maxFinite,
                          child:Container(
                            height: 110,
                            margin: const EdgeInsets.symmetric(
                              vertical: 30,
                            ),
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: Image.network(e.image),
                                  ),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 10,),
                                      Text(
                                        e.title.length <= 20?e.title:e.title.substring(0, 20) + '..',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 12,
                                      ),
                                      const Spacer(),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              _cubit.changeCartQty(e.index, e.cartId, 'minus');

                                              },
                                            child: Container(
                                              height: 45,
                                              width: 45,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(17),
                                                border: Border.all(
                                                  color:const Color(0xffE2E2E2),
                                                ),
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.remove,
                                                  color:e.qty==1? darkBg:primaryColor,
                                                  size: 25,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 18),
                                          SizedBox(
                                              width: 30,
                                              child: Center(
                                                  child:
                                                  Text(e.qty.toString(), style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:  FontWeight.bold ,
                                                    color: Colors.black,
                                                  )))),
                                          const SizedBox(width: 18),
                                          GestureDetector(
                                            onTap: () {
                                              _cubit.changeCartQty(e.index, e.cartId, 'plus');
                                            },
                                            child: Container(
                                              height: 45,
                                              width: 45,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(17),
                                                border: Border.all(
                                                  color: const Color(0xffE2E2E2),
                                                ),
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.add,
                                                  color:e.maxQty<=e.qty?darkBg :primaryColor,
                                                  size: 25,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          _cubit.deleteProduct(e.index, e.cartId);
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color: darkBg,
                                          size: 25,
                                        ),
                                      ),
                                      const Spacer(
                                        flex: 5,
                                      ),
                                      SizedBox(
                                        child:
                                        Text(
                                          "${e.price} \nEGP",
                                          textAlign:TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      seperator: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  getCheckoutButton(context,totalPrice)
                ],
              ),
            )
            :const Center(child: Text('No Product To Show',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),),),
          );
        });
  }

  Widget getCheckoutButton(BuildContext context,int price) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: SizedBox(
        width: double.maxFinite,
        // ignore: deprecated_member_use
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: ElevatedButton(
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              const Center(
                child: Text(
                  "Go To Check Out",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 25,
                child:Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: textColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child:  Text(
                    '${price.toString()} EGP',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            backgroundColor:primaryColor ,
            textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontStyle: FontStyle.normal),
          ),
          onPressed: () {},
      ),
        ),
      ),

    );
  }




}


List<Widget> getChildrenWithSeperator(
    {List<Widget>? widgets, Widget? seperator, bool? addToLastChild = true}) {
  List<Widget> children = [];
  if (widgets!.isNotEmpty) {
    children.add(seperator!);

    for (int i = 0; i < widgets.length; i++) {
      children.add(widgets[i]);

      if (widgets.length - i == 1) {
        if (addToLastChild!) {
          children.add(seperator);
        }
      } else {
        children.add(seperator);
      }
    }
  }
  return children;
}