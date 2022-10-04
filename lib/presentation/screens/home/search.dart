
import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import 'package:bridy_go_user/constants/strings.dart';
import 'package:flutter/material.dart';

import '../../../constants/assets.dart';
import '../../../constants/my_colors.dart';

class SearchScreen extends StatelessWidget {
 String text='';

   SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/images/ic_back.png',
                            scale: 3.2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: VerticalDivider(
                            width: 7,
                            color: primaryColor,
                          ),
                        ),
                        Flexible(
                          child: TextFormField(
                            onChanged: (s){
                              text=s;
                            },
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: Colors.grey[500]),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'search by product name',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                  fontSize: 13.5, color: Colors.grey[300]),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            flagListScreen='search';
                            titleListScreen=text;
                            Navigator.pushReplacementNamed(context, listProductsScreen);
                          },
                          child: Icon(
                            Icons.search,
                            color: primaryColor,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      height: 10,
                      color: Colors.grey[500],
                    ),
                  ),
                  // FadedSlideAnimation(
                  //   ListView.builder(
                  //     shrinkWrap: true,
                  //     itemCount: recentSearch.length,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return ListTile(
                  //         horizontalTitleGap: 0,
                  //         onTap: () {
                  //           Navigator.pop(context);
                  //         },
                  //         dense: true,
                  //         contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  //         //horizontalTitleGap: 0,
                  //         leading: Icon(
                  //           Icons.history,
                  //           color: primaryColor,
                  //           size: 17,
                  //         ),
                  //         title: Text(
                  //           recentSearch[index],
                  //           style: Theme.of(context)
                  //               .textTheme
                  //               .bodyText1!
                  //               .copyWith(
                  //               fontSize: 13.5,
                  //               fontWeight: FontWeight.w500),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  //   beginOffset: Offset(0.4, 0),
                  //   endOffset: Offset(0, 0),
                  //   slideCurve: Curves.linearToEaseOut,
                  // ),
                ],
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  Assets.splashVector,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
