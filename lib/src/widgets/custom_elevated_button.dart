import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomELevatedButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final void Function() onPressed;
  const CustomELevatedButton({
    Key? key,
    required this.text,
    required this.width,
    required this.height, required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      style: ElevatedButton.styleFrom(
        primary: ThemeApp.primaryBlueColor,
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}