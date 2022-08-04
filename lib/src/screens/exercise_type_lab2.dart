import 'package:eie_mobile_app/src/controllers/activity_controller.dart';
import 'package:eie_mobile_app/src/controllers/user_controller.dart';
import 'package:eie_mobile_app/src/data/group_image.dart';
import 'package:eie_mobile_app/src/widgets/custom_alert_dialog.dart';
import 'package:eie_mobile_app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:eie_mobile_app/src/routes/routing.dart';
import 'package:get/get.dart';

import '../services/activity_service.dart';

class ExerciseLaboratory2Screen extends StatelessWidget {
   
  static const nameRoute = '/exercise-type-lab2';

  final activityController = Get.find<ActivityController>();
  final userController = Get.find<UserController>();
  final activityService = Get.find<ActivityService>();
  ExerciseLaboratory2Screen({Key? key}) : super(key: key);
  
  void labelAction (bool isCorrect, String description) {
    if (activityController.answer.isEmpty) {
      activityController.setAnswer(isCorrect);
    } else {
      activityController.getAnswer().removeLast();
      activityController.setAnswer(isCorrect);
    }
    activityController.setDescription = description;
  }

  

  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context)?.settings.arguments as List<String>;
    var width = MediaQuery.of(context).size.width;

    List<GroupImage> options = [
        GroupImage(imageURL: "https://dummyimage.com/200x180", description: "This is a pencil", isCorrect: true, isSelectect: false),
        GroupImage(imageURL: "https://dummyimage.com/200x180", description: "This is a clock", isCorrect: false, isSelectect: false),
        GroupImage(imageURL: "https://dummyimage.com/200x180", description: "This is a table", isCorrect: false, isSelectect: false),
        GroupImage(imageURL: "https://dummyimage.com/200x180", description: "This is a door", isCorrect: false, isSelectect: false),
];

    return Scaffold(
      body: Column(
        children: [
          const SafeArea(child: ProgresBar(percent: 0.2,)),
          const SizedBox(height: 25),
          const Text('Listen and select the correct image', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          const SizedBox(height: 30),
          const SoundIconButton(soundUrl: 'https://sounds-mp3.com/mp3/0002368.mp3'),
          const SizedBox(height: 10,),
          ImageGrid(spaceElements: 20, options: options, condition: 1,),
          const Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: CustomELevatedButton(
                  text: 'Continue',
                  height: 60,
                  width: width * 0.83,
                  onPressed: () async {

                    int  note = activityController.getAnswer().last? 20: 0;
                    final Map<String, dynamic> data = {
                      'puntuacion': note,
                      'usuarioId': userController.getUser.usuarioId,
                      'preguntaId': 4,
                      'valoracionId': 1
                    };
                     await activityService.postNewParticipation(data);
                     showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => CustomAlertDialog(
                        description: activityController.getDescription,
                        route: () => CustomRouting.selectNextScreen(context, routeArgs),
                        isCorrect: activityController.getAnswer().last,
                      )
                    );
                  }
                )
              )
            // Routing.selectNextScreen(context, routeArgs),
        ],
      ),
    );
  }
}


