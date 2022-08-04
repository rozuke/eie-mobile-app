import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:eie_mobile_app/src/widgets/widgets.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:eie_mobile_app/src/routes/routing.dart';

class ExerciseLaboratory1Screen extends StatefulWidget {

  static const nameRoute = '/exercise-type-lab1';
   
  const ExerciseLaboratory1Screen({Key? key}) : super(key: key);

  @override
  State<ExerciseLaboratory1Screen> createState() => _ExerciseLaboratory1ScreenState();
}

class _ExerciseLaboratory1ScreenState extends State<ExerciseLaboratory1Screen> {

  


  String url = 'https://sounds-mp3.com/mp3/0002368.mp3';

  // void selectNextScreen(BuildContext context, List<String> screens) {

  //   print('screens before: $screens');
  //   if(screens.isEmpty){
  //     Navigator.pushNamed(context, QuestionSummaryScreen.nameRoute);
  //   } else {
  //     final nextQuestion = screens.first;
  //     screens.remove(screens.first);
  //     print('screens after: $screens');
  //     Navigator.pushNamed(context, nextQuestion, arguments: screens);
  //   }
  // }
  
  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context)?.settings.arguments as List<String>;

    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SafeArea(child: ProgresBar()),
          SizedBox(height: 30),
          Text('Listen and write the sentence', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          SizedBox(height: 30),
          SoundIconButton(soundUrl: url),
          SizedBox(height: 30),
          Container(
            height: 160,
            width: width * 0.8,
            decoration: BoxDecoration(
              color: ThemeApp.lightBlueColor,
              borderRadius: BorderRadius.circular(20)
            ),
            ),
          Flexible(child: SizedBox(height: 50)),
          _GridLabels(),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: CustomELevatedButton(
              text: 'Continue',
              height: 60,
              width: width * 0.83,
              onPressed:() => CustomRouting.selectNextScreen(context, routeArgs) ),
          )
            
        ],
      ),
    );
  }
}


class _GridLabels extends StatelessWidget {

  

  const _GridLabels({Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    List<ObjetcT> labels = [
      ObjetcT(1, 'the'),
      ObjetcT(2, 'family'),
      ObjetcT(3, 'are'),
      ObjetcT(4, 'breakfast'),
      ObjetcT(5, 'is'),
      ObjetcT(6, 'eating'),
    ];
    // final Map<int,String> labels = { 1:'the', 2:'eating', 3:'is', 4: 'ares', 5: 'breakfast', 6: 'family'};
    return SizedBox(
      width: width * 0.9,
      child: LayoutGrid(
        columnGap: 10,
        rowGap: 15,
        areas: '''
        L1 L2 L3
        L6 L4 L5
        L8 L7 L9
        ''',
        columnSizes: [auto, auto, auto],
        rowSizes: [auto, auto, auto],
        children: labels.map((label) => LabelButton(text: label.text, isAdjustable: true).inGridArea('L${label.pos}')).toList(),
        ),
    );
    
  }
}

class ObjetcT{
  final int pos;
  final String text;

  ObjetcT(this.pos, this.text);

}