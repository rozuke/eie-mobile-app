import 'package:flutter/material.dart';


class ImageGrid extends StatelessWidget {
  const ImageGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:const [
            SizedBox(
              height: 180,
              width: 200,
              child: FadeInImage(
                image:  NetworkImage('https://dummyimage.com/200x180'),
                placeholder: AssetImage('assets/loading-loader.gif')),
            ),
            SizedBox(
              height: 180,
              width: 200,
              child: FadeInImage(
                image:  NetworkImage('https://dummyimage.com/200x180'),
                placeholder: AssetImage('assets/loading-loader.gif')),
            )
          ],
        ),

        const SizedBox(height: 40),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:const [
            SizedBox(
              height: 180,
              width: 200,
              child: FadeInImage(
                image:  NetworkImage('https://dummyimage.com/200x180'),
                placeholder: AssetImage('assets/loading-loader.gif')),
            ),
            SizedBox(
              height: 180,
              width: 200,
              child: FadeInImage(
                image:  NetworkImage('https://dummyimage.com/200x180'),
                placeholder: AssetImage('assets/loading-loader.gif')),
            )
          ],
        )
    ]);
  }
}