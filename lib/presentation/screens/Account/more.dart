import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:bridy_go_user/business_logic/home_cubit/home_cubit.dart';
import 'package:bridy_go_user/constants/strings.dart';
import 'package:bridy_go_user/presentation/screens/Account/my_profile.dart';
import 'package:bridy_go_user/presentation/screens/Account/support.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/my_colors.dart';
import 'about_us.dart';
import 'change_language.dart';
import 'faq.dart';
import 'privacy_policy.dart';


class MoreItems {
  final IconData icon;
  final String? title;
  final String? subtitle;

  MoreItems(this.icon, this.title, this.subtitle);
}

class More extends StatelessWidget {
  const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    List<MoreItems> _moreItems = [
      MoreItems(Icons.favorite, 'saved And Short lists', 'viewAllSaved'),
      MoreItems(Icons.info, 'aboutUs', 'whoWeAre1'),
      MoreItems(Icons.email, 'support', 'connectUsfor'),
      MoreItems(FontAwesomeIcons.clipboardList, 'privacyPolicy',
          'knowOurPolicy'),
      MoreItems(Icons.language, 'changeLanguage', 'setYourPreferred'),
      MoreItems(Icons.info_outline, 'faq', 'getYourQuestions'),
    ];
    return Scaffold(
      backgroundColor: primaryAccent,
      appBar: AppBar(
        backgroundColor: primaryAccent,
        centerTitle: true,
        title: Text(
          'account',
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 17, fontWeight: FontWeight.w500),
        ),
      ),
      body: Stack(
        children: [
          Positioned.directional(
            textDirection: Directionality.of(context),
            start: 10,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 15, top: 0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyProfile()));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 55,
                    ),
                    Text(mUser.name,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyText1!.copyWith(
                            fontSize: 22, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
          ),
          Positioned.directional(
            textDirection: Directionality.of(context),
            start: 12,
            top: 56,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 15, top: 30),
              child: Text(
                'myProfile',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  letterSpacing: 0.08,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[500],
                ),
              ),
            ),
          ),
          PositionedDirectional(
            end: 30,
            top: 50,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyProfile()));
              },
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(50),
                child: FadedScaleAnimation(
                  Image.network(
                    mUser.profileImg,
                    scale: 3,
                    height: 60,
                  ),
                  durationInMilliseconds: 800,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              navBottomCurrentIndex=2;
              Navigator.pushReplacementNamed(context, homeScreen);
            },
            child: Container(
              margin: const EdgeInsets.only(top: 150),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.all(20),
                    leading: FadedScaleAnimation(
                      Icon(
                        Icons.message,
                        color: theme.backgroundColor,
                      ),
                      durationInMilliseconds: 800,
                    ),
                    title: const Text(
                      'inbox',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.5,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        'allYourConvo',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 12,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: ListView(
                        children: [
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _moreItems.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ListTile(
                                horizontalTitleGap: 0,
                                onTap: index == 0
                                    ? () {
                                  navBottomCurrentIndex=3;

                                   Navigator.pushReplacementNamed(context, homeScreen);
                                      }
                                    : index == 1
                                        ? () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const AboutUs()));
                                          }
                                        : index == 2
                                            ? () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Support()));
                                              }
                                            : index == 3
                                                ? () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                PrivacyPolicy()));
                                                  }
                                                : index == 4
                                                    ? () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        ChangeLanguage()));
                                                      }
                                                    : () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const FAQs()));
                                                      },
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                leading: FadedScaleAnimation(
                                  Icon(
                                    _moreItems[index].icon,
                                    size: 18,
                                    color: primaryColor,
                                  ),
                                  durationInMilliseconds: 800,
                                ),
                                title: Text(
                                  _moreItems[index].title!,
                                  style: theme.textTheme.subtitle2!.copyWith(
                                    fontSize: 13.5,
                                  ),
                                ),
                                subtitle: Text(
                                  _moreItems[index].subtitle!,
                                  style: theme.textTheme.caption!.copyWith(
                                      fontSize: 12, color: const Color(0xffb3b3b3)),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
