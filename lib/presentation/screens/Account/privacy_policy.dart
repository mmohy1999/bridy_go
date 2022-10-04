import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';

import '../../../constants/my_colors.dart';



class PrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // var locale = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: primaryAccent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryAccent,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.18,
                width: MediaQuery.of(context).size.width,
                color: primaryAccent,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Text(
                         ' locale.privacyPolicy!',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            'locale.howWeWork!',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.65,
                width: MediaQuery.of(context).size.width,
              )
            ],
          ),
          FadedSlideAnimation(
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'locale.termsOfUse!',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'lorem',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 13,
                            height: 1.7,
                          ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'locale.privacyPolicy!',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text('lorem',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 13,
                              height: 1.7,
                            )),
                    Text('lorem',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 13,
                              height: 1.7,
                            )),
                    Text('lorem',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 13,
                              height: 1.7,
                            ))
                  ],
                )),
            beginOffset: Offset(0, 0.4),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          )
        ],
      ),
    );
  }
}
