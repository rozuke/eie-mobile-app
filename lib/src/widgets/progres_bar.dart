import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgresBar extends StatelessWidget {
  final double percent;
  const ProgresBar({Key? key, required this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final barSize = MediaQuery.of(context).size.width * 0.6;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: IconButton(
              onPressed: (){} ,
              icon: const Icon(Icons.close, size: 35,)),
          ),
          Row(
            children: [
              const Icon(Icons.flag_outlined, size: 30,),
          LinearPercentIndicator(
            width: barSize,
            lineHeight: 16.0,
            barRadius: const Radius.circular(9),
            percent: 0.2,
            backgroundColor: ThemeApp.lightBlueColor,
            progressColor: ThemeApp.primaryBlueColor,
          ),
          const Icon(Icons.flag_rounded, color: ThemeApp.secondaryYellowColor, size: 30)
            ],
          )
        ],
      ),
    );
  }
}