import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:eie_mobile_app/src/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  
  static String nameRoute = 'login';
  const LoginScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 500),
            child: const Center(
              child: _LoginForm()
            )
          ),
          const Expanded(
            child: HeaderCircular(),
          ),
          
          
        ],
      ),
      );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Form(
      child: Column(
        children: [
          const Text('Login', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 40),
          SizedBox(
            width: width * 0.8,
            child: TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.inputLoginDecoration(
                hintText: 'Email',
                prefixIcon: Icons.person)
            ),
          ),
          const SizedBox(height: 60),
          SizedBox(
            width: width * 0.8,
            child: TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.inputLoginDecoration(
                hintText: 'Password',
                prefixIcon: Icons.lock)
            ),
          ),
          const SizedBox(height: 60),
          CustomELevatedButton(text: 'Login',height: 60, width: width * 0.8, ),
        ]
      ),
    );
  }
}

class InputDecorations {
  static InputDecoration inputLoginDecoration({
    required String hintText,
    IconData? prefixIcon
  }){
    return InputDecoration(
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(30)
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: ThemeApp.primaryYellowColor,
          width: 2,
        )
      ),
     
      hintText: hintText,
      hintStyle: const TextStyle(
        color: ThemeApp.lightBlueColor,
        ),
      prefixIcon: prefixIcon != null 
        ?Icon(prefixIcon, color: ThemeApp.primaryBlueColor,)
        :null,
      filled: true,
      fillColor: Colors.white
    );
  }
}


class HeaderCircular extends StatelessWidget {
  const HeaderCircular({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.5;
    return Stack(
      children: [
        Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
            painter: _HeaderCicular(),
          ),
        ),
        Positioned(
            top: 340,
            left: width - 65,
            child: const Image(
              height: 130,
              image: AssetImage('assets/logos/eie-logo.png')
            ),
          ),
      ]
    );
  }
}

class _HeaderCicular extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = ThemeApp.primaryBlueColor;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();

    path.lineTo(0, size.height * 0.30);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.45 , size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }


}