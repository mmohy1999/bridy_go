import 'package:animation_wrappers/animation_wrappers.dart';

import 'package:flutter/material.dart';

import '../../../constants/my_colors.dart';
import '../../../constants/strings.dart';


class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  //  var locale = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: primaryAccent,
      appBar: AppBar(
        backgroundColor: primaryAccent,
        elevation: 0,
        bottom: PreferredSize(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('locale.myProfile!',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500)),
                            const SizedBox(
                              width: 10,
                            ),
                            Text('locale.everythingAboutyou!',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                        color: Colors.grey[500],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            FadedScaleAnimation(
                              Container(
                                padding: const EdgeInsets.all(10),
                                width: 100,
                                child: Image.network(
                                  mUser.profileImg,
                                  height: 60,
                                ),
                              ),
                              durationInMilliseconds: 600,
                            ),
                            CircleAvatar(
                              backgroundColor: primaryColor,
                              radius: 13,
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 13,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            preferredSize: const Size.fromHeight(150)),
      ),
      body: FadedSlideAnimation(
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'locale.fullName!',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                mUser.name,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'locale.emailAddress!',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
              mUser.email,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
               ' locale.phoneNumber!',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "+02 ${mUser.phone}",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                child: GestureDetector(
                  onTap: (){
                    // AuthWebServer web=AuthWebServer();
                    // web.logOut(Statics.token).then((value){
                    //   Navigator.pushReplacement(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => LoginPage()));
                    //
                    // });
                  },
                  child: Text(
                    'logout',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: primaryColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
        beginOffset: const Offset(0.4, 0),
        endOffset: const Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
