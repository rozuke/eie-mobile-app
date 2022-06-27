import 'package:flutter/material.dart';

class ListItemBook extends StatelessWidget {

  final String bookName;
  final List<String> bookLessons;
  

  const ListItemBook({Key? key, required this.bookName, required this.bookLessons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.looks_one_rounded),
        Column(
          children: [
            const Text('Book 1'),
            Text('${bookLessons[0]}, ${bookLessons[1]}, ${bookLessons[2]}, ${bookLessons[3]}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
          ],
        ),
        const Icon(Icons.arrow_forward_ios_outlined),
      ]
    );
  }
}