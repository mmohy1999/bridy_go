import 'package:bridy_go_user/router_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'firebase_options.dart';
import 'helper/Language/languageCubit.dart';
import 'helper/Language/locale.dart';
import 'helper/bloc_observer.dart';
import 'helper/style.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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

