import 'package:flutter/material.dart';

import 'package:eie_mobile_app/src/theme/theme.dart';

class CustomAppBar extends StatelessWidget
  implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: 35,
              height: 35,
              child: Image.asset('assets/logos/eie-logo.png'),
            ),
            Text(title,style: TextStyle(fontWeight: FontWeight.w400),)
          ],
        ),
        elevation: 0,
        backgroundColor: ThemeApp.primaryBlueColor,
    );
  }
}