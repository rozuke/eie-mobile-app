import 'package:flutter/material.dart';
import 'package:eie_mobile_app/src/screens/screens.dart';


class Routing {

  static void selectNextScreen(BuildContext context, List<String> screens) {

    print('screens before: $screens');
    if(screens.isEmpty){
      Navigator.pushNamed(context, QuestionSummaryScreen.nameRoute);
    } else {
      final nextQuestion = screens.first;
      screens.remove(screens.first);
      print('screens after: $screens');
      Navigator.pushReplacementNamed(context, nextQuestion, arguments: screens);
    }
  }

  static void backHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, HomeScreen.nameRoute);
  }
}