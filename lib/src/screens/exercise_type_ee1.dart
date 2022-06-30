import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class ExerciseTypeEE1Screen extends StatelessWidget {
  static String nameRoute = 'exercise_type_ee1';
  const ExerciseTypeEE1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
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
                      color: Color(0xffB6D4E7),
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
          const Align(
              alignment: Alignment(0.0, 0.94),
              child: CustomELevatedButton(text: 'Continue')
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
        decorationColor: Color(0xffA08E27),
        decorationThickness: 3,
        decorationStyle: TextDecorationStyle.dashed,
        fontSize: 18
      )
    );
  }
}