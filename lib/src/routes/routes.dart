import 'package:flutter/material.dart';

import 'package:eie_mobile_app/src/screens/screens.dart';


final pageRoutes = <_Route> [
  _Route('Login', const LoginScreen()),
  _Route('Home', const HomeScreen()),
  _Route('Exercise Homework 1', const ExerciseTypeH1Screen()),
  _Route('Exercise EE 1', const ExerciseTypeEE1Screen()),
  _Route('Exercise EE 2', const ExerciseTypeEE2Screen()),
  _Route('Exercise Laboratroy 1', const ExerciseLaboratory1Screen()),
  _Route('Exercise Laboratory 2', const ExerciseLaboratory2Screen()),
  _Route('Question Summary', const QuestionSummaryScreen()),
  _Route('Book Activities', const BookActivitiesScreen()),
  _Route('Activitie Forum', const ActivityForumScreen() ),
  _Route('Forum Comments', const ForumCommentsScreen()),
];

class _Route {

  final String title;
  final Widget page;

  _Route(this.title, this.page);

}