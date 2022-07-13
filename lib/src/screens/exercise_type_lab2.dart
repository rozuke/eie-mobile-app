import 'package:eie_mobile_app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ExerciseLaboratory2Screen extends StatelessWidget {
   
  const ExerciseLaboratory2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SafeArea(child: ProgresBar()),
          SizedBox(height: 30),
          Text('Listen and select the correct image', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          SizedBox(height: 30),
          SoundIconButton(soundUrl: 'https://sounds-mp3.com/mp3/0002368.mp3'),
          SizedBox(height: 10,),
          ImageGrid(spaceElements: 20,),
          Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: CustomELevatedButton(text: 'Continue', height: 60, width: width * 0.83,)
              )
            
        ],
      ),
    );
  }
}