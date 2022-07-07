import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:eie_mobile_app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ActivityForumScreen extends StatelessWidget {
   
  const ActivityForumScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Forums'),
      body: ListView.separated(
        itemCount: 2,
        itemBuilder: ( _ , index) => _ForumCard(), 
        separatorBuilder: ( _ , __ ) => Divider(indent: 20, endIndent: 20,),
        
      ),
    );
  }
}

class _ForumCard extends StatelessWidget {
  const _ForumCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text('Study by day or at night', style: TextStyle(fontSize: 18, color: ThemeApp.complementaryColor),),
        subtitle: Text('Ea consequat qui quis officia commodo commodo anim aliqua consequat enim non id non ex. Exercitation ea reprehenderit veniam sunt magna magna aute. In aliqua adipisicing esse fugiat tempor qui eiusmod minim ad cillum in non ullamco.', style: TextStyle(), overflow: TextOverflow.ellipsis,),
      ),
    );
  }
}