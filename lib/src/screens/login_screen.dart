import 'package:eie_mobile_app/src/screens/home_screen.dart';
import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:eie_mobile_app/src/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  
  static const String nameRoute = '/login';

  const LoginScreen({Key? key}) : super(key: key);
  

  void autenticateUser(BuildContext context) {
    Navigator.pushReplacementNamed(context, HomeScreen.nameRoute);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      
      body: Center(
        child: ListView(
          children: 
          [Column(
            children: [
              SizedBox(
                height: height * 0.45,
                child: HeaderCircular()
              ),
              SizedBox(height: 30),
              const Text('Login', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 30),
              Form(
                child: Column(
                  children: [
                    _CustomInputForm(hintText: 'Email', inputType: TextInputType.emailAddress, prefixIcon: Icons.person, isHidden: false,),
                    SizedBox(height: 50),
                    _CustomInputForm(hintText: 'Password', inputType: TextInputType.text, prefixIcon: Icons.lock, isHidden: true,),
                    SizedBox(height: 50),
                    CustomELevatedButton(
                      text: 'Login',
                      width: width * 0.8,
                      height: 50,
                      onPressed: () => autenticateUser(context) 
                    )
                  ],
                )
              )
            ],
          ),
        ])
      ),
    );
      
  }
}

class _CustomInputForm extends StatelessWidget {

  final String hintText;
  final TextInputType inputType;
  final IconData prefixIcon;
  final bool isHidden;
  
  const _CustomInputForm({
    Key? key,
    required this.hintText,
    required this.inputType,
    required this.prefixIcon, required this.isHidden}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
            width: width * 0.8,
            child: TextFormField(
              autocorrect: false,
              keyboardType: inputType,
              obscureText: isHidden,
              decoration: _InputDecorations.inputLoginDecoration(
                hintText: hintText,
                prefixIcon: prefixIcon)
            ),
          );
  }
}

class _InputDecorations {
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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      
      child: Stack(
        children: [
          SizedBox(
            height: height * 0.45,
            width: width,
            child: CustomPaint(
                painter: _HeaderCicular(),
              ),
          ),
          Positioned(
              top: height * 0.30 ,
              left: (width * 0.5) - 65,
              child: const Image(
                height: 130,
                image: AssetImage('assets/logos/eie-logo.png')
              ),
            ),
        ]
      ),
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

    path.lineTo(0, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.5, size.height, size.width, size.height * 0.6);
    print('heigh> ${size.height}');
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }


}