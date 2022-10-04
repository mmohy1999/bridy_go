import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/auth_cubit/auth_cubit.dart';
import '../../../constants/my_colors.dart';
import '../../widgets/colorButton.dart';
import '../../widgets/edit_text.dart';


class VerificationScreen extends StatelessWidget {

  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    var locale = AppLocalizations.of(context)!;

    return BlocProvider(
      create:(BuildContext context)=>AuthCubit(),
    child: BlocConsumer<AuthCubit,AuthState>(
        listener: (BuildContext context,AuthState state){},
    builder: (BuildContext context,AuthState state){
      AuthCubit _cubit=AuthCubit.get(context);
      return  Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: primaryAccentDark,
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              color: primaryAccentDark,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'verification',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 22),
                      ),
                      Text(
                        'In less than amin',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 15),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Form(
                  key: _cubit.formGlobalKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "we've sent 6 digit verification code",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 15),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      EditText(
                          controller: _cubit.codeController,
                          hintText: 'Enter 6 digit', labelText: 'Enter code',validator: (code){
                      print(code!.length);
                        if(code.length==6) {
                          return null;
                        }

                        return 'code not correct';
                      }),
                      // Spacer(),
                      GestureDetector(
                          onTap: () {
                        _cubit.verify(context);
                          },
                          child: FadedScaleAnimation(
                            ColorButton('Get started'),
                            durationInMilliseconds: 600,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    )
    );
  }
}
