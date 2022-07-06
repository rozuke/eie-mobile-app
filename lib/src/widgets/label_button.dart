import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:flutter/material.dart';

class LabelButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final bool isAdjustable;
  const LabelButton({Key? key,
    required this.text,
    required this.isAdjustable,
    this.height = 60,
    this.width = 180}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: ThemeApp.secondaryBlueColor,

        minimumSize: isAdjustable
          ?null
          :Size(width!, height!),
        padding: isAdjustable
          ?EdgeInsets.symmetric(vertical: 15, horizontal: 30)
          :null,
        // padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        
      ),
      onPressed: () {},
      child: Text(text, style: TextStyle(fontWeight: FontWeight.w500),),
    );
  }
}