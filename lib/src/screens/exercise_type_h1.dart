
import 'package:flutter/material.dart';
import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:eie_mobile_app/src/routes/routing.dart';
import 'package:eie_mobile_app/src/widgets/widgets.dart';

class ExerciseTypeH1Screen extends StatelessWidget {
  static String nameRoute = '/excercise-type-h1';

  const ExerciseTypeH1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final routeArguments = ModalRoute.of(context)?.settings.arguments as List<String>;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
      
        children: [
              Column(
              children: [
                const SafeArea(child: ProgresBar()),
                const SizedBox(height: 30),
                const Text('Select the rigth picture', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                const SizedBox(height: 20),
                const _FormatText(text: 'This is a pencil',),
                const SizedBox(height: 40),
                ImageGrid(spaceElements: 40,),
                
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: CustomELevatedButton(
                text: 'Continue',
                height: 60,
                width: width * 0.83,
                onPressed: () => CustomRouting.selectNextScreen(context, routeArguments),
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