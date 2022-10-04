import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:bridy_go_user/business_logic/auth_cubit/auth_cubit.dart';
import 'package:bridy_go_user/presentation/widgets/my_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/assets.dart';
import '../../../constants/my_colors.dart';
import '../../../constants/strings.dart';
import '../../widgets/edit_text.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context)=> AuthCubit(),
      child: BlocConsumer<AuthCubit,AuthState>(
        listener: (BuildContext context,AuthState state){},
        builder:(BuildContext context,AuthState state){
          AuthCubit cubit =AuthCubit.get(context);
       //   var locale = AppLocalizations.of(context)!;
          return Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  // alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      color: primaryAccentDark,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          const Spacer(
                            flex: 2,
                          ),
                          FadedScaleAnimation(
                            SizedBox(
                              height: 150,
                              child: Image.asset(Assets.logo,color:Theme.of(context).primaryColor),
                            ),
                            durationInMilliseconds: 600,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Image.asset(Assets.splashVector),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.45,
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.5),
                        height: MediaQuery.of(context).size.height * 0.5 < 375
                            ? MediaQuery.of(context).size.height * 0.7
                            : MediaQuery.of(context).size.height * 0.5,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(60)),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Form(
                                key: cubit.formGlobalKey,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Sign In Now',
                                      style: TextStyle(
                                          color: Colors.blueGrey[300], fontSize: 15),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    EditText(labelText: 'Email Address',
                                        hintText: 'Email Address',controller: cubit.emailController,
                                        validator: (email){
                                          if(email!.isEmpty){
                                            return "email can't be empty";
                                          }
                                          const Pattern emailPattern=r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                                          RegExp regExp= RegExp(emailPattern.toString());
                                          if(regExp.hasMatch(email)){
                                            return null;
                                          }
                                          return "email not valid";
                                        },keyboardType: TextInputType.emailAddress),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    EditText(labelText:'Password',
                                        hintText:'Password',controller: cubit.passwordController,
                                        validator: (password){
                                          if(password!.isEmpty){
                                            return "password can't be empty";
                                          }
                                          if(password.length>8){
                                            return null;
                                          }
                                          return "password must be more than 8";
                                        },isPassword: cubit.isPassword,suffixIcon: Icons.remove_red_eye,suffixIconClick: (){
                                          cubit.showAndHidePassword();
                                        },keyboardType: TextInputType.visiblePassword),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                        cubit.login(context);
                                        },
                                        child: FadedScaleAnimation(
                                          const MyButton(text:'Login'),
                                          durationInMilliseconds: 600,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: (){
                                cubit.goToRegisterScreen(context);
                              },
                              child: Text(
                                'Sing up',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor, fontSize: 15, decoration: TextDecoration.underline,),
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              'Or continue with',
                              style: TextStyle(
                                  color: Colors.blueGrey[300], fontSize: 15),
                            ),
                            const Spacer(),
                            Container(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => AppNavigation()));
                                      Navigator.pushReplacementNamed(context, homeScreen);

                                    },
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                          child: Image.asset(Assets.iconFacebook),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          'facebook',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.white,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => AppNavigation()));
                                    },
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                          child:
                                          Image.asset(Assets.iconGoogle),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          'google',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
