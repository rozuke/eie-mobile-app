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
    
    var width = MediaQuery.of(context).size.width;
    return Container(
      
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Icon(icon, color: Colors.white, size: 50,),
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: width * 0.6,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Text( title, style: TextStyle(fontSize: 20)),
                    Text('$score', style: TextStyle(fontSize: 20, color: ThemeApp.secondaryBlueColor),)
                    
                  ],
                ),
              ),
              SizedBox(height: 5,),
              LinearPercentIndicator(
                width: width * 0.65,
                lineHeight: 15,
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