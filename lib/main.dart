import 'package:eie_mobile_app/src/routes/routes.dart';
import 'package:eie_mobile_app/src/screens/launcher_temp.dart';
import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:eie_mobile_app/src/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.nameRoute,
      routes: AppRoutes.routes,
      theme: ThemeApp.customLightTheme,
      // initialRoute: LoginScreen.nameRoute,
      // routes: {
      //   HomeScreen.nameRoute: ( _ ) => const HomeScreen(),
      //   ExerciseTypeH1Screen.nameRoute: ( _ ) => const ExerciseTypeH1Screen(),
      //   ExerciseTypeEE1Screen.nameRoute: ( _ ) => const ExerciseTypeEE1Screen(),
      //   LoginScreen.nameRoute: ( _ ) => const LoginScreen(),
      // },
    );
  }
}