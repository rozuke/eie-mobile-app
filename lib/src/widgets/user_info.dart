import 'package:flutter/material.dart';


class UserInfo extends StatelessWidget {
  final String userName;
  final String userRol;
  final String textAvatar;

  const UserInfo({Key? key,
    required this.userName,
    required this.userRol,
    required this.textAvatar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.lightBlue[400],
            child: Text(textAvatar, style: TextStyle(color: Colors.white)),
          ),
          title: Text(userName),
          subtitle: Text(userRol),
        )
      ],
    );
  }
}