import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class ExerciseTypeEE1Screen extends StatelessWidget {
  static String nameRoute = 'exercise_type_ee1';
  const ExerciseTypeEE1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SafeArea(child: ProgresBar()),
              SizedBox(height: 30),
              Text('Complete the sentence', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
              SizedBox(height: 150),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                  _FormatText(text: 'Something Peter'),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
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
              
              SizedBox(height: 150),
              LabelButton(text: 'mark'),
              SizedBox(height: 15),
              LabelButton(text: 'marks'),
              SizedBox(height: 15),
              LabelButton(text: 'to mark'),
            ]
          ),
          Container(
          margin: EdgeInsets.only(bottom: 30),
          child: Align(
                  alignment: Alignment.bottomCenter,
                  
                  child: CustomELevatedButton(text: 'Continue', height: 60, width: width * 0.83,)
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
        decorationColor: ThemeApp.complementaryColor,
        decorationThickness: 3,
        decorationStyle: TextDecorationStyle.dashed,
        fontSize: 18
      )
    );
  }
}