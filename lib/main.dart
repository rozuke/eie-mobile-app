import 'package:flutter/material.dart';
import 'package:eie_mobile_app/src/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ExerciseTypeEE1Screen.nameRoute,
      themeMode: ThemeMode.light,
      routes: {
        HomeScreen.nameRoute: ( _ ) => const HomeScreen(),
        ExerciseTypeH1Screen.nameRoute: ( _ ) => const ExerciseTypeH1Screen(),
        ExerciseTypeEE1Screen.nameRoute: ( _ ) => const ExerciseTypeEE1Screen(),
      },
    );
  }
}