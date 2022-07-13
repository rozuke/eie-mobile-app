import 'package:eie_mobile_app/src/screens/forum_comments_screen.dart';
import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:eie_mobile_app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ActivityForumScreen extends StatelessWidget {

  static const nameRoute = '/activity-forum';
   
  const ActivityForumScreen({Key? key}) : super(key: key);

  void viewCommentsForum(BuildContext context) {
    Navigator.pushNamed(context, ForumCommentsScreen.nameRoute);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Forums'),
      body: ListView.separated(
        itemCount: 2,
        itemBuilder: ( _ , index) => _ForumCard(
          onPressed: () => viewCommentsForum(context),
        ), 
        separatorBuilder: ( _ , __ ) => Divider(indent: 20, endIndent: 20,),
        
      ),
    );
  }
}

class _ForumCard extends StatelessWidget {
  
  final void Function() onPressed;

  const _ForumCard({Key? key,
    required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: onPressed,
        title: Text('Study by day or at night', style: TextStyle(fontSize: 18, color: ThemeApp.complementaryColor),),
        subtitle: Text('Ea consequat qui quis officia commodo commodo anim aliqua consequat enim non id non ex. Exercitation ea reprehenderit veniam sunt magna magna aute. In aliqua adipisicing esse fugiat tempor qui eiusmod minim ad cillum in non ullamco.', style: TextStyle(), overflow: TextOverflow.ellipsis,),
      ),
    );
  }
}