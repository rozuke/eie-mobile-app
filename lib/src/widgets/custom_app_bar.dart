import 'package:flutter/material.dart';

import 'package:eie_mobile_app/src/theme/theme.dart';

class CustomAppBar extends StatelessWidget
  implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: 40,
              height: 40,
              child: Image.asset('assets/logos/eie-logo.png'),
            ),
            const Text('Books')
          ],
        ),
        elevation: 0,
        backgroundColor: ThemeApp.primaryBlueColor,
    );
  }
}