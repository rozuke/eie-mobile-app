
import 'package:eie_mobile_app/src/controllers/activity_controller.dart';
import 'package:eie_mobile_app/src/controllers/user_controller.dart';
import 'package:eie_mobile_app/src/data/group_image.dart';
import 'package:eie_mobile_app/src/services/activity_service.dart';
import 'package:flutter/material.dart';
import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:eie_mobile_app/src/routes/routing.dart';
import 'package:eie_mobile_app/src/widgets/widgets.dart';
import 'package:get/get.dart';

import '../widgets/custom_alert_dialog.dart';

class ExerciseTypeH1Screen extends StatelessWidget {
  static String nameRoute = '/excercise-type-h1';
  final activityController = Get.find<ActivityController>();
  final userController = Get.find<UserController>();
  final activityService = Get.find<ActivityService>();
  ExerciseTypeH1Screen({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {

    final routeArguments = ModalRoute.of(context)?.settings.arguments as List<String>;
    var width = MediaQuery.of(context).size.width;


    List<GroupImage> options = [
        GroupImage(imageURL: "https://drive.google.com/uc?export=view&id=18WifRZs7edfAGEjIj3Jzgjr2hjLG0hD3", description: "It's a picture", isCorrect: true, isSelectect: false),
        GroupImage(imageURL: "https://drive.google.com/uc?export=view&id=1-Fg-Ov3YQDOhb9HzziwXv6cK6H01Hz1t", description: "It's a table", isCorrect: false, isSelectect: false),
        GroupImage(imageURL: "https://drive.google.com/uc?export=view&id=1cgoEoapwbLLnxH7wyBS6a3d8On_RIUo6", description: "It's a door", isCorrect: false, isSelectect: false),
        GroupImage(imageURL: "https://drive.google.com/uc?export=view&id=1KFcyLbCZTFvtFSOPTtLyMmW6ug7Ye297", description: "It's a window", isCorrect: false, isSelectect: false),
];

    return Scaffold(
      body: Column(
      
        children: [
              Column(
              children: [
                const SafeArea(child: ProgresBar(percent: 1,)),
                const SizedBox(height: 30),
                const Text('Select the rigth picture', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                const SizedBox(height: 20),
                const _FormatText(text: "It's a picture",),
                const SizedBox(height: 40),
                ImageGrid(spaceElements: 40, options: options, condition: 4,),
                
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: CustomELevatedButton(
                text: 'Check',
                height: 60,
                width: width * 0.83,
                onPressed: () async {


                  int  note = activityController.getAnswer().last? 25: 0;
                    final Map<String, dynamic> data = {
                      'puntuacion': note,
                      'usuarioId': userController.getUser.usuarioId,
                      'preguntaId': 1,
                      'valoracionId': 1
                    };
                     await activityService.postNewParticipation(data);
                     showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => CustomAlertDialog(
                        description: activityController.getDescription,
                        route: () => CustomRouting.selectNextScreen(context, routeArguments),
                        isCorrect: activityController.getAnswer().last,
                      )
                    );
                  },
              ),
            )
        ],
      ),
    );
  }
}

class _FormatText extends StatelessWidget {
  final String text ;
  const _FormatText({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        shadows: [Shadow(color: Colors.black, offset: Offset(0, -5))],
        color: Colors.transparent,
        decoration: TextDecoration.underline,
        decorationColor: ThemeApp.primaryYellowColor,
        decorationThickness: 2,
        fontSize: 18
      )
    );
  }
}