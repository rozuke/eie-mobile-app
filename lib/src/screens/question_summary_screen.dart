import 'package:eie_mobile_app/src/controllers/activity_controller.dart';
import 'package:flutter/material.dart';
import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:eie_mobile_app/src/routes/routing.dart';
import 'package:eie_mobile_app/src/widgets/widgets.dart';
import 'package:get/get.dart';


class QuestionSummaryScreen extends StatelessWidget {

  static const nameRoute = '/question-summary'; 
  final activityController = Get.find<ActivityController>();
  QuestionSummaryScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    // var questions = activityController.getAnswer().map((e) => e ? 1 : 0).reduce((a, b) => a + b) as int;
    int questions = activityController.rightAnswers;
    final finalScore = (questions * 25).round();
    print(questions);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Questions Summary'),
      body: Column(
        children: [
          const SizedBox(height: 50,),
          const Align(
            alignment: Alignment.center,
            child: Text('Completed the questions', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: ThemeApp.secondaryYellowColor))
          ),
          const SizedBox(height: 30),
          const Image(
            image: AssetImage('assets/congrats.png'),
            height: 300,
            width: 300,
            fit: BoxFit.fitHeight,),
          const SizedBox(height: 90),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _BoxInfo(title: 'Questions', score: activityController.getAnswer().length, color: ThemeApp.secondaryBlueColor),
                _BoxInfo(title: 'Correct', score: questions, color: ThemeApp.secondaryYellowColor),
                _BoxInfo(title: 'Final Score', score: finalScore, color: ThemeApp.complementaryColor),
              ],
            ),
            const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: CustomELevatedButton(
                  text: 'Continue',
                  height: 60,
                  width: width * 0.83,
                  onPressed: () => CustomRouting.backHome(context),
                )
              )
            
        ],
      ),
    );
  }
}

class _BoxInfo extends StatelessWidget {

  final String title;
  final int? score;
  final Color color;
  const _BoxInfo({Key? key,
    required this.title,
    this.score,
    required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: 125,
      width: 120,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8)
      ),  
      child: Column(
        
        children: [
          const SizedBox(height: 10),
          Text(title, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500), ),
          const SizedBox(height: 15),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 10),
            height: 65,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8)
            ),
            child: Text('$score', style: TextStyle(color: color, fontSize: 26),),
          ),
        ],
      ),
    );
  }
}