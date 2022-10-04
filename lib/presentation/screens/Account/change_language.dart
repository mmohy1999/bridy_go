import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:bridy_go_user/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/my_colors.dart';
import '../../../helper/Language/languageCubit.dart';
import '../../../helper/Language/locale.dart';
import '../../widgets/colorButton.dart';

class ChangeLanguage extends StatefulWidget {
  final bool isStart;

  ChangeLanguage([this.isStart = false]);
  @override
  _ChangeLanguageState createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  late LanguageCubit _languageCubit;

  int? _selectedLanguage = -1;

  void initState()  {
    super.initState();
    _languageCubit = LanguageCubit();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List languages = [
      "English",
      "عربى",

    ];
    return Scaffold(
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Text(
                          locale.language!,
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          locale.preferredLanguage!,
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                color: primaryAccent,
                height: MediaQuery.of(context).size.height * 0.65,
                width: MediaQuery.of(context).size.width,
              )
            ],
          ),
          Container(
            color: Colors.white,
            child: FadedSlideAnimation(
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(20)),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        locale.selectPreferredLanguage!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.only(bottom: 50),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 2),
                          child: RadioListTile(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            activeColor: primaryColor,
                            title: Text(languages[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500)),
                            value: index,
                            groupValue: _selectedLanguage,
                            onChanged: (dynamic val) {
                              setState(() {
                                _selectedLanguage = val;
                                print(val);
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              beginOffset: const Offset(0, 0.4),
              endOffset: const Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                if (_selectedLanguage == 0) {
                  _languageCubit.selectEngLanguage();

                } else if (_selectedLanguage == 1) {
                  _languageCubit.selectArabicLanguage();
                }
                if (widget.isStart) {
                  appLang= _selectedLanguage==1?'ar':'en';
                  Navigator.pushReplacementNamed(context, loginScreen);
                } else {
                  Navigator.pop(context);
                }
              },
              child: FadedScaleAnimation(
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                      height: 55,
                      child: FadedScaleAnimation(
                        ColorButton(locale.submit),
                        durationInMilliseconds: 600,
                      )),
                ),
                durationInMilliseconds: 600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
