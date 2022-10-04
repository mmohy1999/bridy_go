import 'package:bridy_go_user/constants/strings.dart';
import 'package:bridy_go_user/data/models/user.dart';
import 'package:bridy_go_user/data/repository/auth_repository.dart';
import 'package:bridy_go_user/data/web_serves/auth_web_server.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../constants/my_colors.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  //region filed
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final codeController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  bool isPassword = true;
  late AuthRepository _authRepository;

  //endregion

  AuthCubit() : super(LoginPageState()) {
    _authRepository = AuthRepository(AuthWebServer());
  }

  static AuthCubit get(context) => BlocProvider.of(context);

  login(context) {
    if (formGlobalKey.currentState!.validate()) {
      formGlobalKey.currentState!.save();
      User user = User.login(email: emailController.text, password: passwordController.text);
      _authRepository.login(user).then((user) {
        if (user != null) {
          mUser = user;
          Navigator.pushReplacementNamed(context, homeScreen);
        } else {
          Fluttertoast.showToast(
            msg: 'email or password not correct',fontSize: 16,
            gravity: ToastGravity.BOTTOM,backgroundColor: textColorError,
            toastLength: Toast.LENGTH_SHORT );

        }
      });
    }
  }

  showAndHidePassword() {
    isPassword = !isPassword;
    emit(ShowAndHidePassword());
  }

  goToRegisterScreen(context) {
    Navigator.pushNamed(context, registerScreen);
    emit(RegisterPageState());
  }

  goToVerifyScreen(context) {
    Navigator.pushNamed(context, verifyScreen);
    emit(VerifyPageState());
  }

  verify(context) {
    if (formGlobalKey.currentState!.validate()) {
      formGlobalKey.currentState!.save();
      _authRepository
          .verify(mEmail!, codeController.text)
          .then((user) {
        if (user != null) {
          mUser = user;
          Navigator.pushReplacementNamed(context, homeScreen);
        } else {
          if (kDebugMode) {
            print('code do not match');
          }

      }});
    }

  }

  register(context) {
    if (formGlobalKey.currentState!.validate()) {
      formGlobalKey.currentState!.save();
      User user = User.register(
          email: emailController.text,
          password: passwordController.text,
          name: nameController.text,
          phone: phoneController.text);
      _authRepository.register(user).then((value) {
        if (value.runtimeType == bool && value) {
          emit(RegisterState());
          mEmail=user.email;
          goToVerifyScreen(context);
        } else {
          if (kDebugMode) {
            print(value);
          }
        }
      });
    }
  }
}
