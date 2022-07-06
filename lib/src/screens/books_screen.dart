import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:eie_mobile_app/src/widgets/widgets.dart';



class BooksScreen extends StatefulWidget {
   static String nameRoute = 'home';
  const BooksScreen({Key? key}) : super(key: key);

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Books'),
      body: SingleChildScrollView(
        child: Column(
          children: [
          const SizedBox(height: 50,),
          const Divider(height: 0,),
          _LevelBook(),
          const Divider(height: 0,),
          _LevelBook(),
          const Divider(height: 0,),
          _LevelBook(),
          const Divider(height: 0,),
          ],
        ),
      ),
    );
  }
}

class _ListViewBooks extends StatelessWidget {
  const _ListViewBooks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<Book> books = [
      Book(name: 'Book 1', lessons: ['The classroom', 'Bob\'s a barber', 'Is he a teacher?','Today is Thursday'], icon: Icons.looks_one_rounded),
      Book(name: 'Book 2', lessons: ['Lesson 1', 'Lesson 2', 'Lesson 3','Lesson 4'], icon: Icons.looks_two_rounded),
      Book(name: 'Book 3', lessons: ['Lesson 1', 'Lesson 2', 'Lesson 3','Lesson 4'], icon: Icons.looks_3_rounded),
      Book(name: 'Book 4', lessons: ['Lesson 1', 'Lesson 2', 'Lesson 3','Lesson 4'], icon: Icons.looks_4_rounded),
      Book(name: 'Book 5', lessons: ['Lesson 1', 'Lesson 2', 'Lesson 3','Lesson 4'], icon: Icons.looks_5_rounded),
      Book(name: 'Book 6', lessons: ['Lesson 1', 'Lesson 2', 'Lesson 3','Lesson 4'], icon: Icons.looks_6_rounded)
    ];
    
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: books.length,
      itemBuilder: (BuildContext context, int index) {
        final book = books[index];
        return ListTile(
          leading: Icon(book.icon, size: 50, color: ThemeApp.complementaryColor,),
          title: Text(book.name),
          subtitle: Text(book.lessons.join(', ')),
          trailing: const Icon(Icons.arrow_forward_ios_rounded, color: ThemeApp.complementaryColor,)
        );
      },
    );
  }
}

class Book {
  final String name;
  final List<String> lessons;
  final IconData icon;

  const Book({
    required this.name,
    required this.lessons,
    required this.icon,
  });
}

class Item {
  
  Item({
    required this.id,
    required this.expandedValue,
  });

  int id;
  String expandedValue;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      id: index,
      expandedValue: 'Book $index',
    );
  });
}


Widget _LevelBook() {
  
  return const ExpansionTile(
    collapsedBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    leading: Icon(Icons.star_outlined, color: ThemeApp.secondaryYellowColor, size: 30 ),
    title: Text('Level 1: Basic', style: TextStyle(fontSize: 18),),
    children: [
     _ListViewBooks()
    ],
  );
  
}