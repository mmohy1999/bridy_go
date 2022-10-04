import 'package:bridy_go_user/business_logic/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/assets.dart';
import '../../constants/my_colors.dart';
import 'cart/cart_screen.dart';


class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return BlocConsumer<HomeCubit,HomeState>(
        listener:(BuildContext context,HomeState state){} ,
        builder:(BuildContext context,HomeState state){
          var _cubit=HomeCubit.get(context);
          // _cubit.getMessages();
          return WillPopScope(
              onWillPop: () async{
                _cubit.onBottomNavigationTap(0);
                return false;
              },
              child:  Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  iconTheme: const IconThemeData(color: Colors.white),
                  titleSpacing: 0,
                  backgroundColor: Colors.transparent,
                  title: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 20),
                    child: Text(
                      "Support Team",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                ),
                body: Stack(
                  children: [
                    Container(
                      color: Colors.black,
                      child: Opacity(
                          opacity: 0.65, child: Image.asset(Assets.centralWednue)),
                    ),
                    Stack(
                      children: [
                        SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.13,
                            ),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: getChildrenWithSeperator(
                                      addToLastChild: false,
                                      widgets:
                                      _cubit.messages.map((e){
                                          return e.userId==null?
                                          Container(
                                            margin: const EdgeInsets.only(left: 15),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 10),
                                            decoration: BoxDecoration(
                                              color:e.massage==''?Colors.redAccent.withOpacity(0) :primaryColor,
                                              borderRadius: const BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight: Radius.circular(20),
                                                  bottomLeft: Radius.circular(20)),
                                            ),
                                            child: Padding(
                                              padding:
                                              const EdgeInsetsDirectional.only(start: 20),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text(e.massage,
                                                      textAlign: TextAlign.end,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .copyWith(
                                                          fontSize: 13.5,
                                                          color: Colors.white)),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(e.time,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2!
                                                          .copyWith(
                                                          fontSize: 10,
                                                          color: Colors.grey[300]))
                                                ],
                                              ),
                                            ),
                                          ):
                                          Row(
                                            children: [
                                              Container(
                                                child: Container(
                                                  margin: const EdgeInsets.only(right: 15),
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 15, vertical: 10),
                                                  decoration: BoxDecoration(
                                                    color: primaryAccent,
                                                    borderRadius: const BorderRadius.only(
                                                        topLeft: Radius.circular(20),
                                                        topRight: Radius.circular(20),
                                                        bottomRight: Radius.circular(20)),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Text(e.massage,
                                                        textAlign: TextAlign.start,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1!
                                                            .copyWith(
                                                            fontSize: 13.5,
                                                            color: Colors.black),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(e.time,
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .bodyText2!
                                                              .copyWith(
                                                              fontSize: 10,
                                                              color: Colors.grey[300]))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }).toList(),
                                      seperator: const SizedBox(
                                        height: 5,
                                      )
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            child: Form(
                              key: _cubit.formGlobalKey,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: primaryAccent),
                                      child: TextFormField(
                                        controller: _cubit.messageController,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(color: Colors.grey),
                                        decoration: InputDecoration(
                                          isDense: true,
                                          border: InputBorder.none,
                                          hintText: 'Write Your Message',
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(fontSize: 13.5, color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: primaryColor),
                                    child: IconButton(
                                        icon: const Icon(
                                          Icons.send,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                        onPressed: () {

                                          _cubit.sendMessage();
                                        }),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )) ;
    }
    );
  }
}
