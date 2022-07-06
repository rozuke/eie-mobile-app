import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:eie_mobile_app/src/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class BookActivitiesScreen extends StatelessWidget {
   
  const BookActivitiesScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Book 1',),
      body: ListView(
        children: [
          
          _ActivitieCard()
        ],
      )
    );
  }
}


class _ActivitieCard extends StatelessWidget {
  const _ActivitieCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: 90,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      color: ThemeApp.lightBlueColor,
      alignment: Alignment.center,
      child: ListTile(
        
        leading: Icon(Icons.create, size: 50,),
        title: Text('Foro', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
      ),
    );
  }
}