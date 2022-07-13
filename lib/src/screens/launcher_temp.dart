import 'package:eie_mobile_app/src/routes/routes.dart';
import 'package:flutter/material.dart';


// class LauncherTemp extends StatelessWidget {
//   const LauncherTemp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: _ListScreens(),
//     );
//   }
// }

// class _ListScreens extends StatelessWidget {
//   const _ListScreens({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       separatorBuilder: (context, index) => Divider(
//         color: Colors.black,
//       ),
//       itemCount: pageRoutes.length,
//       itemBuilder: (context, index) => ListTile(
//         title: Text(pageRoutes[index].routeName),
//         onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => pageRoutes[index].page)),),

//     );
//   }
// }