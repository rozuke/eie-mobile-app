import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eie_mobile_app/src/widgets/widgets.dart';

class ExerciseTypeEE2Screen extends StatelessWidget {
   
  const ExerciseTypeEE2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Column(
             children: const [
              SafeArea(
                child: ProgresBar(),
              ),
              SizedBox(height: 30),
              Text('Complete the dialog', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
              SizedBox(height: 50),
              Align(
                alignment: Alignment.centerLeft,
                child: _BoxMeessage(
                  isLeft: true,
                  message: 'Who wa in the classroom this morning?')
                ),
              Align(
                alignment: Alignment.centerRight,
                child: _BoxMeessage(
                  isLeft: false,
                  message: ''),   
                ),

              SizedBox(height: 50),
              LabelButton(text: 'It was the teacher'),
              SizedBox(height: 20),
              LabelButton(text: 'It\'s was the teacher'),
              SizedBox(height: 20),
              LabelButton(text: 'There is she is'),

             ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 30),
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
        , height: isLeft? 220: 180),

        Container(
          padding: const EdgeInsets.only(top: 40, left: 80),
          width: 250,
          child: Text(message, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),)
        )
      ],
    );
  }
}