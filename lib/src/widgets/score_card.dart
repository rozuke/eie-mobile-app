import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:eie_mobile_app/src/theme/theme.dart';

class ScoreCard extends StatelessWidget {

  final String title;
  final double score;
  final double percentage;
  final Color color;
  final IconData icon;
  const ScoreCard({Key? key,
    required this.title,
    required this.score,
    required this.percentage,
    required this.color,
    required this.icon}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    final width = MediaQuery.of(context).size.width;
    final size = width * 0.12;
    return Container(
      
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Icon(icon, color: Colors.white, size: 40,),
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: width * 0.6,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Text( title, style: TextStyle(fontSize: 16)),
                    Text('$score', style: TextStyle(fontSize: 16, color: ThemeApp.secondaryBlueColor),)
                    
                  ],
                ),
              ),
              SizedBox(height: 5,),
              LinearPercentIndicator(
                width: width * 0.65,
                lineHeight: 12,
                barRadius: const Radius.circular(9),
                percent: percentage,
                backgroundColor: ThemeApp.lightBlueColor,
                progressColor: ThemeApp.secondaryBlueColor,
              ),
              
            ],
          )
        ],
      )
    );
  }
}