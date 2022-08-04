import 'package:eie_mobile_app/src/controllers/activity_controller.dart';
import 'package:eie_mobile_app/src/controllers/user_controller.dart';
import 'package:eie_mobile_app/src/models/course_model.dart';
import 'package:eie_mobile_app/src/models/user_model.dart';
import 'package:eie_mobile_app/src/screens/login_screen.dart';
import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:eie_mobile_app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:eie_mobile_app/src/services/service.dart';
import 'package:get/get.dart';

import '../models/result_model.dart';
class ProfileScreen extends StatelessWidget {
   final userController = Get.find<UserController>();
   final activityController  = Get.find<ActivityController>();
  ProfileScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final User user = userController.getUser;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Profile'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProfileInfo(user: user),
          
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: ListTile(
              leading: Icon(Icons.newspaper, color: ThemeApp.secondaryYellowColor),
              title: Text("Information" , style: TextStyle(fontSize: 18),),
            )
          ),
          
          _CourseInfo(course: userController.getCourse,),

          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: ListTile(
              leading: Icon(Icons.newspaper, color: ThemeApp.secondaryYellowColor),
              title: Text('ALC Score', style: TextStyle(fontSize: 18),),
            )
          ),

          _ALCScoreInfo(result: activityController.getResult,)
          
        ],
      ),
    );
  }
}


class _ALCScoreInfo extends StatelessWidget {
  final Result result;
  const _ALCScoreInfo({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    
    return Flexible(
      child: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: ThemeApp.complementaryColor, width: 2),
          borderRadius: BorderRadius.circular(10)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child:   Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              ScoreCard(title: 'Homework', score: result.notaHomework.toString() , percentage: (result.notaHomework! / 100), color: ThemeApp.skillColorHW, icon: Icons.create,),
              Divider(color: ThemeApp.complementaryColor,height: 2),
              ScoreCard(title: 'Evaluation Exercise', score: result.notaEE.toString(), percentage: (result.notaEE! / 100), color: ThemeApp.skillColorEE, icon: Icons.assignment,),
              Divider(color: ThemeApp.complementaryColor,height: 2),
              ScoreCard(title: 'Laboratory', score: result.notaLaboratory.toString(), percentage: (result.notaLaboratory! / 100), color: ThemeApp.skillColorLab, icon: Icons.headphones,),
              
            ],
          )
        ),
      ),
    );
  }
}

class _CourseInfo extends StatelessWidget {

  final Course course;
  const _CourseInfo({Key? key, required this.course}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final info = [{
      'icon' : Icons.book_outlined,
      'title' : 'Current Book',
      'subtitle' : ['Book 1', 'Level 1']
    }, 
    {
      'icon' : Icons.chrome_reader_mode_rounded,
      'title' : 'Current Book',
      'subtitle' : ['Book 1', 'Level 1']
    }
    ];
    
    return Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _InfoBookCard(
          title: 'Current Book',
          description: [course.libro, course.nivel],
          icon: Icons.book_outlined
        ),
        SizedBox(width: 5,),
        _InfoBookCard(
          title: 'Lessos',
          description: course.lecciones,
          icon: Icons.chrome_reader_mode_outlined
        ),
      ],
    );
  }
}

class _InfoBookCard extends StatelessWidget {
  final String title;
  final List<String> description;
  final IconData icon;
  const _InfoBookCard({
    Key? key, required this.title, required this.description, required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.4;
    return Container(
      height: 150,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: ThemeApp.complementaryColor, width: 2),
        borderRadius: BorderRadius.circular(10)
      ),
      child: ListTile(
        horizontalTitleGap: 0,
        leading: Icon(icon, color: ThemeApp.secondaryYellowColor),
        title: Text( title, style: TextStyle(fontSize: 16),),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: description.map((subtitle) => Text("°$subtitle", style: TextStyle(color: ThemeApp.secondaryBlueColor),)).toList(),
      )
      )
    
      );
    
  }
}

Widget buildTile( ExpandedTile tile ) => ListTile(
  leading: tile.icon != null
    ? Icon(tile.icon, color: ThemeApp.secondaryBlueColor)
    : null,
  title: Text(tile.title),
);


class _ProfileInfo extends StatelessWidget {
  final User user;
  const _ProfileInfo({Key? key, required this.user}) : super(key: key);

  // charts for avatar circle
  String getChartsForAvatar (String name) {
    var value = name.split(" ");
    if (value.length > 1) {
      return "${value[0][0]}${value[1][0]}";
    } else {
      return value[0][0];
    }

  }
  @override
  Widget build(BuildContext context) {
    String textAvatar = getChartsForAvatar(user.nombre);
    return Container(
      height: 100,
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.lightBlue[300],
            child: Text(textAvatar, style: TextStyle(color: Colors.white))
          ),
          title: Text(user.nombre, style: TextStyle(color: ThemeApp.primaryBlueColor, fontSize: 20),),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Student', style: TextStyle(color: ThemeApp.primaryBlueColor),),
              Text(user.email, style: TextStyle(color: ThemeApp.secondaryBlueColor),)
            ],
          ),
          trailing: IconButton(icon: const Icon(Icons.logout),onPressed: (() async {
            await GoogleSignInAuth.logout();
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
          } )),

        ),
      ),
    );
  }
}


class ExpandedTile {
  final String title;
  final IconData? icon;
  final List<ExpandedTile> tiles;
  bool isExpanded;

  ExpandedTile({
    required this.title,
    this.icon,
    this.tiles = const [],
    this.isExpanded = false,
  });
}

