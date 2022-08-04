import 'package:flutter/material.dart';

import 'package:eie_mobile_app/src/screens/screens.dart';


class AppRoutes {

  static  Map<String, Widget Function(BuildContext)> routes = {
    LoginScreen.nameRoute: (context) => LoginScreen(),
    HomeScreen.nameRoute: (context) => HomeScreen(),
    ExerciseTypeH1Screen.nameRoute: (context) => ExerciseTypeH1Screen(),
    ExerciseTypeEE1Screen.nameRoute: (context) => ExerciseTypeEE1Screen(),
    ExerciseTypeEE2Screen.nameRoute: (context) => ExerciseTypeEE2Screen(),
    ExerciseLaboratory1Screen.nameRoute: (context) => const ExerciseLaboratory1Screen(),
    ExerciseLaboratory2Screen.nameRoute: (context) => ExerciseLaboratory2Screen(),
    ActivitiesScreen.nameRoute: (context) =>  ActivitiesScreen(),
    ActivityForumScreen.nameRoute: (context) => ActivityForumScreen(),
    BookActivitiesScreen.nameRoute: (context) => const BookActivitiesScreen(),
    // ForumCommentsScreen.nameRoute: (context) => ForumCommentsScreen(),
    QuestionSummaryScreen.nameRoute: (context) => QuestionSummaryScreen(),
    
  };


  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => LoginScreen()
    );
  }

}






// final pageRoutes = <_Route> [
//   _Route('Login', const LoginScreen()),
//   _Route('Home', const HomeScreen()),
//   _Route('Exercise Homework 1', const ExerciseTypeH1Screen()),
//   _Route('Exercise EE 1', const ExerciseTypeEE1Screen()),
//   _Route('Exercise EE 2', const ExerciseTypeEE2Screen()),
//   _Route('Exercise Laboratroy 1', const ExerciseLaboratory1Screen()),
//   _Route('Exercise Laboratory 2', const ExerciseLaboratory2Screen()),
//   _Route('Question Summary', const QuestionSummaryScreen()),
//   _Route('Book Activities', const BookActivitiesScreen()),
//   _Route('Activitie Forum', const ActivityForumScreen() ),
//   _Route('Forum Comments', const ForumCommentsScreen()),
// ];

// class _Route {

//   final String routeName;
//   final Widget page;

//   _Route(this.routeName, this.page);

// }