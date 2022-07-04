import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:eie_mobile_app/src/widgets/sound_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:eie_mobile_app/src/widgets/widgets.dart';


class ExerciseLaboratory1Screen extends StatefulWidget {
   
  const ExerciseLaboratory1Screen({Key? key}) : super(key: key);

  @override
  State<ExerciseLaboratory1Screen> createState() => _ExerciseLaboratory1ScreenState();
}

class _ExerciseLaboratory1ScreenState extends State<ExerciseLaboratory1Screen> {

  String url = 'https://sounds-mp3.com/mp3/0002368.mp3';
  
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
              Text('Listen and write the sentence', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
              SizedBox(height: 50),
              SoundIconButton(soundUrl: url),
              SizedBox(height: 50),
              Container(
                height: 200,
                width: width * 0.8,
                decoration: BoxDecoration(
                  color: ThemeApp.lightBlueColor,
                  borderRadius: BorderRadius.circular(20)
                ),
                ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  LabelButton(text: 'family', isAdjustable: true),
                  LabelButton(text: 'family', isAdjustable: true),
                  LabelButton(text: 'family', isAdjustable: true),
                  LabelButton(text: 'family', isAdjustable: true),
                  
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LabelButton(text: 'family', isAdjustable: true),
                  LabelButton(text: 'family', isAdjustable: true),
                ],
              )
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


class _GridLabels extends StatelessWidget {

  final List<Widget> labels;

  const _GridLabels({Key? key,
    required this.labels
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [

        ],
      )
    );
  }
}