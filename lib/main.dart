import 'package:bridy_go_user/router_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'helper/Language/languageCubit.dart';
import 'helper/Language/locale.dart';
import 'helper/bloc_observer.dart';
import 'helper/style.dart';

void main() {
  BlocOverrides.runZoned(
        () {
      runApp( MyApp(appRouter: AppRouter(),));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
   MyApp({Key? key,required this.appRouter}) : super(key: key){
    // LanguageCubit();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // localizationsDelegates: const [
      //   AppLocalizationsDelegate(),
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      debugShowCheckedModeBanner: false,
      theme: uiTheme(),
      onGenerateRoute: appRouter.generateRoute,
    );

  }
}

