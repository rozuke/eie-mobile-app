import 'package:flutter/material.dart';


class ImageGrid extends StatelessWidget {
  final double spaceElements;
  const ImageGrid({Key? key, required this.spaceElements}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
      return GridView.builder(
        shrinkWrap: true,
        primary: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.3,
          mainAxisSpacing: spaceElements

        ),
        padding: EdgeInsets.symmetric(horizontal: spaceElements / 2),
        itemCount: 4,
        itemBuilder: ( _ , index) => SizedBox(
          width: 200,
          height: 180,
              child: FadeInImage(
                image:  NetworkImage('https://dummyimage.com/200x180'),
                placeholder: AssetImage('assets/loading-loader.gif')),
            ),
      );
  }
}



// Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children:const [
//             SizedBox(
//               height: 180,
//               width: 200,
//               child: FadeInImage(
//                 image:  NetworkImage('https://dummyimage.com/200x180'),
//                 placeholder: AssetImage('assets/loading-loader.gif')),
//             ),
//             SizedBox(
//               height: 180,
//               width: 200,
//               child: FadeInImage(
//                 image:  NetworkImage('https://dummyimage.com/200x180'),
//                 placeholder: AssetImage('assets/loading-loader.gif')),
//             )
//           ],
//         ),

//         const SizedBox(height: 40),

//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children:const [
//             SizedBox(
//               height: 180,
//               width: 200,
//               child: FadeInImage(
//                 image:  NetworkImage('https://dummyimage.com/200x180'),
//                 placeholder: AssetImage('assets/loading-loader.gif')),
//             ),
//             SizedBox(
//               height: 180,
//               width: 200,
//               child: FadeInImage(
//                 image:  NetworkImage('https://dummyimage.com/200x180'),
//                 placeholder: AssetImage('assets/loading-loader.gif')),
//             )
//           ],
//         )
//     ]);