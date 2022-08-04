import 'package:eie_mobile_app/src/controllers/activity_controller.dart';
import 'package:eie_mobile_app/src/controllers/user_controller.dart';
import 'package:eie_mobile_app/src/services/activity_service.dart';
import 'package:eie_mobile_app/src/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:eie_mobile_app/src/routes/routing.dart';
import 'package:get/get.dart';
import '../widgets/widgets.dart';

class ExerciseTypeEE1Screen extends StatelessWidget {
  static String nameRoute = '/exercise-type-ee1';
  final activityController = Get.find<ActivityController>();
  final userController = Get.find<UserController>();
  final activityService = Get.find<ActivityService>();
  ExerciseTypeEE1Screen({Key? key}) : super(key: key);


  void labelAction (bool isCorrect, String description) {
    if (activityController.answer.length < 2) {
      activityController.setAnswer(isCorrect);
    } else {
      activityController.getAnswer().removeLast();
      activityController.setAnswer(isCorrect);
    }
    activityController.setDescription = description;

    print(activityController.answer.length);
    print(description );
  }
  
  @override
  Widget build(BuildContext context) {

    final routeArguments = ModalRoute.of(context)?.settings.arguments as List<String>;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          const SafeArea(child: ProgresBar(percent: 0.5,)),
          const SizedBox(height: 30),
          const Text('Complete the sentence', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              _FormatText(text: 'Something Peter'),
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ThemeApp.lightBlueColor,
                ),
              ),
              _FormatText(text: 'the wrong answer on a test'),
              
            ],
          ),
          
          SizedBox(height: 100),
          LabelButton(text: 'mark', isAdjustable: false,
            onPressed: () => labelAction(false, "Something Peter mark the wrong answer on a test" )),
          SizedBox(height: 15),
          LabelButton(text: 'marks', isAdjustable: false,
          onPressed: () => labelAction(true, "Something Peter marks the wrong answer on a test" )),
          SizedBox(height: 15),
          LabelButton(text: 'to mark', isAdjustable: false,
          onPressed:() => labelAction(false, "Something Peter to mark the wrong answer on a test" )),
          Spacer(),
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
                      'preguntaId': 2,
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
             }
            ),
          )
            
        ],
      ),
    );
  }
}


class _FormatText extends StatelessWidget {
  
  final String text;

  const _FormatText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        shadows: [Shadow(color: Colors.black, offset: Offset(0, -5))],
        color: Colors.transparent,
        decoration: TextDecoration.underline,
        decorationColor: ThemeApp.complementaryColor,
        decorationThickness: 3,
        decorationStyle: TextDecorationStyle.dashed,
        fontSize: 14
      )
    );
  }
}