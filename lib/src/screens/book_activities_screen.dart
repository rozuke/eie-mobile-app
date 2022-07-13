import 'package:eie_mobile_app/src/screens/activity_forum_screen.dart';
import 'package:eie_mobile_app/src/screens/forum_comments_screen.dart';
import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:eie_mobile_app/src/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class BookActivitiesScreen extends StatelessWidget {

  static const nameRoute = '/book-activities';
   
  const BookActivitiesScreen({Key? key}) : super(key: key);
  
  void viewForumTopics(BuildContext context) {
   Navigator.pushNamed(context, ActivityForumScreen.nameRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Book 1',),
      body: ListView(
        children: [
          
          _ActivityCard(
            onPressed: () => viewForumTopics(context),
          )
        ],
      )
    );
  }
}


class _ActivityCard extends StatelessWidget {

  final void Function() onPressed;

  const _ActivityCard({Key? key,
    required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      color: ThemeApp.lightBlueColor,
      alignment: Alignment.center,
      child: ListTile(
        onTap: onPressed,
        leading: Icon(Icons.create, size: 50,),
        title: Text('Foro', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
      ),
    );
  }
}