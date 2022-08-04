import 'package:eie_mobile_app/src/controllers/activity_controller.dart';
import 'package:eie_mobile_app/src/controllers/user_controller.dart';
import 'package:eie_mobile_app/src/services/activity_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eie_mobile_app/src/widgets/widgets.dart';
import 'package:eie_mobile_app/src/routes/routing.dart';
import 'package:get/get.dart';

import '../widgets/custom_alert_dialog.dart';

class ExerciseTypeEE2Screen extends StatelessWidget {
  
  static const nameRoute = '/exercise-type-ee2';
  final activityController = Get.find<ActivityController>();
  final userController = Get.find<UserController>();
  final activityService = Get.find<ActivityService>();
  ExerciseTypeEE2Screen({Key? key}) : super(key: key);
  

  void labelAction (bool isCorrect, String description) {
    if (activityController.answer.length < 3) {
      activityController.setAnswer(isCorrect);
    } else {
      activityController.getAnswer().removeLast();
      activityController.setAnswer(isCorrect);
    }
    activityController.setDescription = description;
  }

  @override
  Widget build(BuildContext context) {

    final routeArguments = ModalRoute.of(context)?.settings.arguments as List<String>;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          const SafeArea( child: ProgresBar(percent: 0.75,)),
          const SizedBox(height: 30),
          const Text('Complete the dialog', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          const SizedBox(height: 30),
              const Align(
                alignment: Alignment.centerLeft,
                child: _BoxMeessage(
                  isLeft: true,
                  message: 'Who wa in the classroom this morning?')
                ),
              const Align(
                alignment: Alignment.centerRight,
                child: _BoxMeessage(
                  isLeft: false,
                  message: ''),   
                ),

              const SizedBox(height: 20),
              LabelButton(text: 'It was the teacher', isAdjustable: false,
                onPressed: ()=> labelAction(true, "It was the teacher")),
              const SizedBox(height: 20),
              LabelButton(text: 'It\'s was the teacher', isAdjustable: false,
                onPressed: ()=> labelAction(false, "It's was the teacher")),
              const SizedBox(height: 20),
              LabelButton(text: 'There is she is', isAdjustable: false,
                onPressed: ()=> labelAction(false, "There is she is")),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: CustomELevatedButton(
                  text: 'Continue',
                  height: 60,
                  width: width * 0.83,
                  onPressed: () async{

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


class _BoxMeessage extends StatelessWidget {
  final bool isLeft;
  final String message;
  const _BoxMeessage({
    Key? key,
    required this.isLeft,
    required this.message
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(isLeft 
          ?'assets/box-message-left.svg'
          :'assets/box-message-right.svg'
        , height: isLeft? 160: 130),

        Container(
          padding: const EdgeInsets.only(top: 20, left: 40),
          width: 150,
          child: Text(message, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),)
        )
      ],
    );
  }
}