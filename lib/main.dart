import 'package:eie_mobile_app/src/screens/exercise_type_h1.dart';
import 'package:eie_mobile_app/src/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ExcerciseTypeH1Screen.nameRoute,
      themeMode: ThemeMode.light,
      routes: {
        HomeScreen.nameRoute: ( _ ) => const HomeScreen(),
        ExcerciseTypeH1Screen.nameRoute: ( _ ) => const ExcerciseTypeH1Screen(),
      },
    );
  }
}