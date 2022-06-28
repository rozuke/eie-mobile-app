import 'package:flutter/material.dart';

class CustomELevatedButton extends StatelessWidget {
  final String text;
  const CustomELevatedButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widthSize = (MediaQuery.of(context).size.width * 0.3);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xff003566),
        padding: EdgeInsets.symmetric(horizontal: widthSize,vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        
      ),
      onPressed: () {},
      child: Text(text),
    );
  }
}