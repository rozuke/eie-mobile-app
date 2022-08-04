import 'package:eie_mobile_app/src/screens/exercise_type_ee1.dart';
import 'package:eie_mobile_app/src/screens/exercise_type_ee2.dart';
import 'package:eie_mobile_app/src/screens/exercise_type_h1.dart';
import 'package:eie_mobile_app/src/screens/exercise_type_lab1.dart';
import 'package:eie_mobile_app/src/screens/exercise_type_lab2.dart';
import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:eie_mobile_app/src/widgets/widgets.dart';



class BooksScreen extends StatefulWidget {

  
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
          // _LevelBook(),
          // const Divider(height: 0,),
          // _LevelBook(),
          // const Divider(height: 0,),
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

  

  void selectTheFirsExercise(BuildContext context){
    List<String> questionsScreen = [
    // ExerciseLaboratory1Screen.nameRoute,
    ExerciseLaboratory2Screen.nameRoute,
    ExerciseTypeEE1Screen.nameRoute,
    ExerciseTypeEE2Screen.nameRoute,
    ExerciseTypeH1Screen.nameRoute,
    ];
    // questionsScreen.shuffle();
    final firstQuestion = questionsScreen[0] ;
    questionsScreen.remove(firstQuestion);

    Navigator.pushNamed(context, firstQuestion, arguments: questionsScreen);
  }
  @override
  Widget build(BuildContext context) {
    const List<Book> books = [
      Book(name: 'Book 1', lessons: ['The classroom.', 'Bob\'s a barber.', 'Is he a teacher?','Today is Thursday.'], icon: Icons.looks_one_rounded),
      Book(name: 'Book 2', lessons: ['My family is big.', 'Whose office is this?', 'Are you studying?','It\'s time for lunch.'], icon: Icons.looks_two_rounded),
      Book(name: 'Book 3', lessons: ['He gets up early.', 'Taking a train.', 'Where are you from?','I\'m in the Army now.'], icon: Icons.looks_3_rounded),
      Book(name: 'Book 4', lessons: ['Sports and games.', 'He\'s in the Army now.', 'Where are my clothes.','Pencils in 10 colors.'], icon: Icons.looks_4_rounded),
      Book(name: 'Book 5', lessons: ['What\'s wrong?', 'Where can I get shampoo.', 'I\'ll take a trip.','I\'ll buy a gallon of milk'], icon: Icons.looks_5_rounded),
      Book(name: 'Book 6', lessons: ['How\'s the weather?', 'Taking a trip.', 'Sending mail.','Let\'s take a vacation.'], icon: Icons.looks_6_rounded)
    ];

    
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: books.length,
      itemBuilder: (BuildContext context, int index) {
        final book = books[index];
        return ListTile(
          onTap: () => selectTheFirsExercise(context),
          leading: Icon(book.icon, size: 50, color: ThemeApp.complementaryColor,),
          title: Text(book.name, style: TextStyle(fontSize: 16.5)),
          subtitle: Text(book.lessons.join(' - ')),
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