import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eie_mobile_app/src/widgets/widgets.dart';
import 'package:eie_mobile_app/src/routes/routing.dart';

class ExerciseTypeEE2Screen extends StatelessWidget {
  
  static const nameRoute = '/exercise-type-ee2';

  const ExerciseTypeEE2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final routeArguments = ModalRoute.of(context)?.settings.arguments as List<String>;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SafeArea( child: ProgresBar()),
          SizedBox(height: 30),
          Text('Complete the dialog', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          SizedBox(height: 30),
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

              SizedBox(height: 20),
              LabelButton(text: 'It was the teacher', isAdjustable: false),
              SizedBox(height: 20),
              LabelButton(text: 'It\'s was the teacher', isAdjustable: false,),
              SizedBox(height: 20),
              LabelButton(text: 'There is she is', isAdjustable: false,),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: CustomELevatedButton(
                  text: 'Continue',
                  height: 60,
                  width: width * 0.83,
                  onPressed: () => Routing.selectNextScreen(context, routeArguments),
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
        , height: isLeft? 160: 130),

        Container(
          padding: const EdgeInsets.only(top: 20, left: 40),
          width: 150,
          child: Text(message, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),)
        )
      ],
    );
  }
}