import 'package:flutter/material.dart';

import 'package:eie_mobile_app/src/screens/screens.dart';


class AppRoutes {

  static  Map<String, Widget Function(BuildContext)> routes = {
    LoginScreen.nameRoute: (context) => const LoginScreen(),
    HomeScreen.nameRoute: (context) => const HomeScreen(),
    ExerciseTypeH1Screen.nameRoute: (context) => const ExerciseTypeH1Screen(),
    ExerciseTypeEE1Screen.nameRoute: (context) => const ExerciseTypeEE1Screen(),
    ExerciseTypeEE2Screen.nameRoute: (context) => const ExerciseTypeEE2Screen(),
    ExerciseLaboratory1Screen.nameRoute: (context) => const ExerciseLaboratory1Screen(),
    ExerciseLaboratory2Screen.nameRoute: (context) => const ExerciseLaboratory2Screen(),
    ActivitiesScreen.nameRoute: (context) => const ActivitiesScreen(),
    ActivityForumScreen.nameRoute: (context) => const ActivityForumScreen(),
    BookActivitiesScreen.nameRoute: (context) => const BookActivitiesScreen(),
    ForumCommentsScreen.nameRoute: (context) => const ForumCommentsScreen(),
    QuestionSummaryScreen.nameRoute: (context) => const QuestionSummaryScreen(),
    
  };


  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const LoginScreen()
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