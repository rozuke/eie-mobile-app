import 'package:eie_mobile_app/src/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {

  final String description;
  final bool isCorrect;
  final void Function() route;
  const CustomAlertDialog({Key? key, required this.description, required this.route, required this.isCorrect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 50),
      title: ListTile(
      leading: isCorrect
          ? Icon( Icons.check, color: Colors.green,)
          : Icon(Icons.check, color: Colors.red[400],),
        title: isCorrect
          ?const Text('Correct answer', style: TextStyle(color: Colors.green),)
          :const Text('Wrong answer'),
        subtitle: Text(description,),
        
      ),
      actions: [
        CustomELevatedButton(text: "Continue", width: width * 0.7, height: 70, onPressed: route)
      ],
    );
  }
}

