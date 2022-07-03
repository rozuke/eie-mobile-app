import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:eie_mobile_app/src/widgets/widgets.dart';

class ExerciseTypeH1Screen extends StatelessWidget {
  static String nameRoute = 'excercise_type_h1';
  const ExerciseTypeH1Screen({Key? key}) : super(key: key);
  
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
            Text('Select the rigth picture', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
            SizedBox(height: 20),
            _FormatText(text: 'This is a pencil',),
            Padding(
              padding: EdgeInsets.only(top: 80),
              child: ImageGrid(),
            ),
          ],
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
        decorationColor: ThemeApp.primaryYellowColor,
        decorationThickness: 2,
        fontSize: 18
      )
    );
  }
}