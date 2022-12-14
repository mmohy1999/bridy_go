import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<Locale> {

  LanguageCubit() : super(const Locale('en'));

  void selectEngLanguage() {
    emit(const Locale('en'));
  }

  void selectArabicLanguage() {
    emit(const Locale('ar'));
  }


}
