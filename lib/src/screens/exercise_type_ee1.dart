import 'package:flutter/material.dart';
import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:eie_mobile_app/src/routes/routing.dart';
import '../widgets/widgets.dart';

class ExerciseTypeEE1Screen extends StatelessWidget {
  static String nameRoute = '/exercise-type-ee1';
  const ExerciseTypeEE1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final routeArguments = ModalRoute.of(context)?.settings.arguments as List<String>;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SafeArea(child: ProgresBar()),
          SizedBox(height: 30),
          Text('Complete the sentence', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          SizedBox(height: 100),
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
          LabelButton(text: 'mark', isAdjustable: false, ),
          SizedBox(height: 15),
          LabelButton(text: 'marks', isAdjustable: false,),
          SizedBox(height: 15),
          LabelButton(text: 'to mark', isAdjustable: false,),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: CustomELevatedButton(
              text: 'Continue',
              height: 60,
              width: width * 0.83,
              onPressed: () => CustomRouting.selectNextScreen(context, routeArguments)
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