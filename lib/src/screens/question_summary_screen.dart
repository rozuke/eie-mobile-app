import 'package:flutter/material.dart';
import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:eie_mobile_app/src/routes/routing.dart';
import 'package:eie_mobile_app/src/widgets/widgets.dart';


class QuestionSummaryScreen extends StatelessWidget {

  static const nameRoute = '/question-summary'; 
  
  const QuestionSummaryScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: 'Questions Summary'),
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
              children: const [
                _BoxInfo(title: 'Questions', score: 5, color: ThemeApp.secondaryBlueColor),
                _BoxInfo(title: 'Correct', score: 4, color: ThemeApp.secondaryYellowColor),
                _BoxInfo(title: 'Final Score', score: 80, color: ThemeApp.complementaryColor),
              ],
            ),
            Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
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
  final int score;
  final Color color;
  const _BoxInfo({Key? key,
    required this.title,
    required this.score,
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