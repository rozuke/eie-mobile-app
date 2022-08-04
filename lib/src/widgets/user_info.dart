import 'package:flutter/material.dart';


class UserInfo extends StatelessWidget {
  final String userName;
  final String userRol;

  const UserInfo({Key? key,
    required this.userName,
    required this.userRol,
    }) : super(key: key);


  String getChartsForAvatar (String name) {
    var value = name.split(" ");
    if (value.length > 1) {
      return "${value[0][0]}${value[1][0]}";
    } else {
      return value[0][0];
    }

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.lightBlue[400],
            child: Text(getChartsForAvatar(userName), style: TextStyle(color: Colors.white)),
          ),
          title: Text(userName),
          subtitle: Text(userRol),
        )
      ],
    );
  }
}