import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:flutter/material.dart';

class LabelButton extends StatelessWidget {
  final String text;
  const LabelButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: ThemeApp.secondaryBlueColor,
        minimumSize: const Size(180, 70),
        // padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        
      ),
      onPressed: () {},
      child: Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
    );
  }
}