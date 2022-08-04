import 'package:eie_mobile_app/src/controllers/activity_controller.dart';
import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LabelButton extends StatelessWidget {
  final activityController = Get.find<ActivityController>();
  final String text;
  final double? height;
  final double? width;
  final bool isAdjustable;
  final void Function() onPressed;
  LabelButton({Key? key,
    required this.text,
    required this.isAdjustable,
    this.height = 60,
    this.width = 180,
    required this.onPressed}) : super(key: key);

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
      onPressed: onPressed,
        
      child: Text(text, style: TextStyle(fontWeight: FontWeight.w500),),
    );
  }
}