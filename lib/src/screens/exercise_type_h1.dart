import 'package:flutter/material.dart';
import 'package:eie_mobile_app/src/widgets/widgets.dart';

class ExcerciseTypeH1Screen extends StatelessWidget {
  static String nameRoute = 'excercise_type_h1';
  const ExcerciseTypeH1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: const[
              SafeArea(child: ProgresBar()),
              SizedBox(height: 30),
              Text('Select the rigth picture', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
              SizedBox(height: 20),
              _FormatText(text: 'This is a pencil',),
              Padding(
                padding: EdgeInsets.only(top: 80),
                child: ImageGrid(),
              ),
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
        decorationColor: Color(0xffFFC300),
        decorationThickness: 2,
        fontSize: 18
      )
    );
  }
}