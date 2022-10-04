import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';

import '../../../constants/assets.dart';
import '../../../constants/my_colors.dart';


class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryAccent,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: primaryAccent,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const Spacer(),
                FadedScaleAnimation(
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                    child: Image.asset(Assets.logo),
                  ),
                  durationInMilliseconds: 600,
                ),
                const Spacer(
                  flex: 2,
                ),
                SizedBox(
                  // padding: EdgeInsets.symmetric(horizontal: 50),
                  width: MediaQuery.of(context).size.height * 0.2,
                  child: Image.asset(Assets.splashVector),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.49,
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: MediaQuery.of(context).size.height * 0.485,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)),
            ),
            child: ListView(
              children: [
                Text(
                  'Who we are',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text('lorem',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 13,
                          height: 1.7,
                        )),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'How we started',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
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
            ),
          )
        ],
      ),
    );
  }
}
