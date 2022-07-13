import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:eie_mobile_app/src/widgets/widgets.dart';

class ActivitiesScreen extends StatelessWidget {
   
  const ActivitiesScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Activities'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Row(
              children: [
                SizedBox(width: 20),
                Icon(Icons.list_alt_outlined, color: ThemeApp.primaryYellowColor, size: 40),
                Text('Basic level course', style: TextStyle(fontSize: 16),)
              ],
            ),
            _BooksChanel()
          ],
        ),
      ),
    );
  }
}

class _BooksChanel extends StatelessWidget {
  const _BooksChanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    List<Chanel> chanels = [
      Chanel(title: 'B1', name: 'Book 1 activities'),
      Chanel(title: 'B2', name: 'Book 2 activities'),
      Chanel(title: 'B3', name: 'Book 3 activities'),
      Chanel(title: 'B4', name: 'Book 4 activities'),
      Chanel(title: 'B5', name: 'Book 5 activities'),
      Chanel(title: 'B6', name: 'Book 6 activities'),
      Chanel(title: 'B6', name: 'Book 6 activities'),
    ];
    
      return GridView.builder(
        shrinkWrap: true,
        primary: false,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
        ),
        padding: const EdgeInsets.all(30),
        itemCount: chanels.length,
        itemBuilder: ( _ , index) {
          return _CardChanel(title: chanels[index].title, name: chanels[index].name,);
        },
      );
  }
}

class _CardChanel extends StatelessWidget {
  final String title;
  final String name;
  const _CardChanel({
    Key? key,
    required this.title,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const double size = 150;
    
    return GestureDetector(
      onTap: (){},
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: ThemeApp.lightBlueColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: size * 0.7,
              width: size * 0.7,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ThemeApp.secondaryBlueColor,
                borderRadius: BorderRadius.circular(10)
              ),
              
              child: Text(title, style: TextStyle(fontSize: 24, color: Colors.white)),
            ),
            Text(name, style: TextStyle(fontSize: 14))
          ],
        )
      ),
    );
  }
}

class Chanel {
  final String title;
  final String name;

  Chanel({
    required this.title,
    required this.name});

}