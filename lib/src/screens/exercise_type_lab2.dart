import 'package:eie_mobile_app/src/controllers/activity_controller.dart';
import 'package:eie_mobile_app/src/widgets/custom_alert_dialog.dart';
import 'package:eie_mobile_app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:eie_mobile_app/src/routes/routing.dart';
import 'package:get/get.dart';

class ExerciseLaboratory2Screen extends StatelessWidget {
   
  static const nameRoute = '/exercise-type-lab2';
  final activityController = Get.find<ActivityController>();
  ExerciseLaboratory2Screen({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context)?.settings.arguments as List<String>;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          const SafeArea(child: ProgresBar()),
          const SizedBox(height: 25),
          const Text('Listen and select the correct image', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          const SizedBox(height: 30),
          const SoundIconButton(soundUrl: 'https://sounds-mp3.com/mp3/0002368.mp3'),
          const SizedBox(height: 10,),
          ImageGrid(spaceElements: 20,),
          const Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: CustomELevatedButton(
                  text: 'Continue',
                  height: 60,
                  width: width * 0.83,
                  onPressed: () => {
                     showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => CustomAlertDialog(
                        description: activityController.getDescription,
                        route: () => CustomRouting.selectNextScreen(context, routeArgs),
                        isCorrect: activityController.getAnswer().last,
                      )
                    )
                  }
                )
              )
            // Routing.selectNextScreen(context, routeArgs),
        ],
      ),
    );
  }
}