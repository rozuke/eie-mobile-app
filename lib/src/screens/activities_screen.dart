import 'package:eie_mobile_app/src/controllers/activity_controller.dart';
import 'package:eie_mobile_app/src/controllers/user_controller.dart';
import 'package:eie_mobile_app/src/models/forum_model.dart';
import 'package:eie_mobile_app/src/screens/activity_forum_screen.dart';
import 'package:eie_mobile_app/src/screens/book_activities_screen.dart';
import 'package:eie_mobile_app/src/services/activity_service.dart';
import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:eie_mobile_app/src/widgets/widgets.dart';
import 'package:get/get.dart';

class ActivitiesScreen extends StatelessWidget {
  static const nameRoute = '/activities';

  final activityService = Get.find<ActivityService>();
  final activityController = Get.find<ActivityController>();
  final userController = Get.find<UserController>(); 
  ActivitiesScreen({Key? key}) : super(key: key);
  

  // goToForumTopics() {
  //   activityController.loadForumTopics(userController.getCourse.cursoId);
  //   return true;
  // }

  @override
  Widget build(BuildContext context) {

    List<Chanel> chanels = [
      Chanel(title: 'Forum', name: 'Forum'),
    ];

    var course = userController.getCourse;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Activities'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.list_alt_outlined, color: ThemeApp.secondaryYellowColor, size: 40,),
              title: Text(course.nombre, style: TextStyle(fontSize: 18)),
              subtitle: Text(course.libro),
            ),
            GridView.builder(
              shrinkWrap: true,
              primary: false,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
              ),
              padding: const EdgeInsets.all(40),
              itemCount: chanels.length,
              itemBuilder: ( _ , index) => _CardChanel(
                title: chanels[index].title,
                name: chanels[index].name,
                onPressed: () {
                  
                  Navigator.pushNamed(context, ActivityForumScreen.nameRoute);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}


class _CardChanel extends StatelessWidget {
  final String title;
  final String name;
  final Function() onPressed;
  const _CardChanel({
    Key? key,
    required this.title,
    required this.name,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const double size = 150;
    
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: ThemeApp.lightBlueColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: size * 0.9,
              width: size * 0.9,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ThemeApp.secondaryBlueColor,
                borderRadius: BorderRadius.circular(10),
              ),
              
              child: Image.asset(
                'assets/logos/foro-logo.png',
              ),
            ),
            Text(name, style: TextStyle(fontSize: 16, color: ThemeApp.primaryBlueColor),),
          ],
        )
      ),
    );
  }
}

class Chanel {
  final String title;
  final String name;

  Chanel({
    required this.title,
    required this.name,
    });

}