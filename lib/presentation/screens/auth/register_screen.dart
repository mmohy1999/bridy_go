
import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:bridy_go_user/presentation/widgets/edit_text.dart';
import 'package:bridy_go_user/presentation/widgets/my_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/auth_cubit/auth_cubit.dart';
import '../../../constants/my_colors.dart';





class RegisterScreen extends StatelessWidget {

   const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(BuildContext context)=>AuthCubit(),
      child: BlocConsumer<AuthCubit,AuthState>(
        listener: (BuildContext context,AuthState state){},
        builder: (BuildContext context,AuthState state){
          AuthCubit _cubit=AuthCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: primaryAccentDark,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back,size: 24,),
                onPressed: () {
                  Navigator.pop(context);
                },),
            ),
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
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
                            'register',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 22),
                          ),
                          Text(
                            'in less then a minute',
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
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    height: MediaQuery.of(context).size.height * 0.7 < 430
                        ? MediaQuery.of(context).size.height * 0.82
                        : MediaQuery.of(context).size.height * 0.77,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60)),
                    ),
                    child: Form(
                      key: _cubit.formGlobalKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          EditText(labelText: 'Full name',
                              hintText:'Enter full name',controller: _cubit.nameController
                              ,validator: (name){
                                if(name!.isEmpty){
                                  return "name can't be empty";
                                }
                                return null;
                              }),
                          EditText(labelText: 'Phone number',hintText: 'Enter mobile number'
                            ,controller: _cubit.phoneController,
                            validator: (phone){
                              if(phone!.isEmpty){
                                return "phone can't be empty";
                              }

                              const Pattern phonePattern=r'^01[0-2,5]{1}[0-9]{8}$';
                              RegExp regExp= RegExp(phonePattern.toString());
                              if(regExp.hasMatch(phone)){
                                return null;
                              }
                              return "phone not valid";
                            },keyboardType: TextInputType.phone,),
                          EditText(labelText:'Email address', hintText: 'Enter email address',
                              controller: _cubit.emailController,
                              validator: (email){
                                if(email!.isEmpty){
                                  return "email can't be empty";
                                }
                                //r'^01[0-2,5]{1}[0-9]{8}$'
                                const Pattern emailPattern=r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                                RegExp regExp= RegExp(emailPattern.toString());
                                if(regExp.hasMatch(email)){
                                  return null;
                                }
                                return "email not valid";
                              },keyboardType: TextInputType.emailAddress),
                          EditText(labelText: 'Password',
                              hintText: 'Enter password',controller: _cubit.passwordController,
                              validator: (password){
                                if(password!.isEmpty){
                                  return "password can't be empty";
                                }
                                if(password.length>8){
                                  return null;
                                }
                                return "password must be more than 8";
                              },isPassword: _cubit.isPassword,suffixIcon: Icons.remove_red_eye,suffixIconClick: (){
                                _cubit.showAndHidePassword();
                              },keyboardType: TextInputType.visiblePassword),

                          const Spacer(),

                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                              onTap: () {
                                  _cubit.register(context);
                                }
                              ,
                              child: FadedScaleAnimation(
                                const MyButton(text:'Sing up'),
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
        },
      ),
    );
  }
}
