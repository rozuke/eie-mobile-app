import 'package:flutter/material.dart';

class LabelButton extends StatelessWidget {
  final String text;
  const LabelButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xff56AFDE),
        minimumSize: Size(150, 70),
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