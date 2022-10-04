import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';

import '../../../constants/assets.dart';
import '../../../constants/my_colors.dart';
import '../chat.dart';

class Chats {
  String? img, title, location, message;
  Chats(this.img, this.title, this.location, this.message);
}
class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Chats> chatList = [
      Chats(Assets.centralWednue, "Central Wednue", 'venue',
          'helloSir1'),
      Chats(Assets.silver_stone, "Silver Stone", 'photographer',
          'noWorries'),
      Chats(Assets.heaven24, "Heaven24", 'venue', 'yesAllTheGuests'),
      Chats(Assets.good_timeVenue, "Good Time Venue", 'makeup',
          'helloSir1'),
      Chats(Assets.magic_studios, "Magic Studios", 'decor',
          'thatWillBe'),
      Chats(
          Assets.shine_salon, "Shine Salon",'catering','helloSir1'),
      Chats(Assets.taste_city, "Taste City", 'venue', 'noItWillNot'),
      Chats(Assets.silver_stone, "Silver Stone", 'photographer',
          'noWorries'),
      Chats(Assets.heaven24, "Heaven24", 'venue', 'yesAllTheGuests'),
      Chats(Assets.good_timeVenue, "Good Time Venue", 'makeup',
         'helloSir1'),
      Chats(Assets.magic_studios, "Magic Studios", 'decor',
          'thatWillBe'),
      Chats(
          Assets.shine_salon, "Shine Salon",'catering','helloSir1'),
    ];
    return Scaffold(
      // appBar: AppBar(
      //   titleSpacing: 0,
      //   elevation: 1,
      //   backgroundColor: Colors.white,
      //   title: Text(
      //     locale.inbox!,
      //     style: Theme.of(context)
      //         .textTheme
      //         .bodyText1!
      //         .copyWith(fontWeight: FontWeight.bold, fontSize: 17),
      //   ),
      //   actions: [
      //     IconButton(
      //         icon: Icon(
      //           Icons.search_rounded,
      //           color: primaryColor,
      //           size: 20,
      //         ),
      //         onPressed: () {}),
      //   ],
      // ),
      body: Container(
        child: FadedSlideAnimation(
          ListView.builder(
            padding: EdgeInsets.only(top: 20),
            shrinkWrap: true,
            itemCount: 12,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Chat()));
                    },
                    child: Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Row(
                        children: [
                          FadedScaleAnimation(
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5)),
                              width: 75,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset(chatList[index].img!)),
                            ),
                            durationInMilliseconds: 500,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(chatList[index].title!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(chatList[index].location!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(
                                            fontSize: 10,
                                          )),
                                      Spacer(),
                                      Text("11:45 ${'am'}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(
                                            fontSize: 10,
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Container(
                                          child: Text(chatList[index].message!,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(
                                                  fontSize: 12,
                                                  fontWeight:
                                                  FontWeight.w500)),
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Divider(
                      height: 5,
                      color: primaryColor.withOpacity(0.5),
                    ),
                  ),
                ],
              );
            },
          ),
          beginOffset: Offset(0.4, 0),
          endOffset: Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
        ),
      ),
    );
  }
}
