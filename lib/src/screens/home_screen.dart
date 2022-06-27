import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   static String nameRoute = 'home';
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: const Center(
        // child: _ListViewBooks(),
      )
    );
  }
}

class _ListViewBooks extends StatelessWidget {
  const _ListViewBooks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const lessons = ['The classroom', 'Bob\'s a barber', 'Is he teacher?', 'Today is Thursday'];
    return ListView(

    );
  }
}



class Item {
  
  Item({
    required this.id,
    required this.expandedValue,
    required this.headerValue
  });

  int id;
  String expandedValue;
  String headerValue;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      id: index,
      expandedValue: 'Book $index',
      headerValue: 'Header $index'
    );
  });
}

class Listview1Screen extends StatelessWidget {
  final options = const [
    'Megaman',
    'Metal Gear',
    'Super Smash',
    'Final Fantasy'
  ];
  const Listview1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listview Tipo 1"),
      ),
      body: ListView(
        children: [
//iteracion
          ...options
              .map((game) => ListTile(
                    title: Text(game),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  ))
              .toList()
        ],
      ),
    );
  }
}

class _LevelBook extends StatelessWidget {
  const _LevelBook({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Container(
      width: queryData.size.width * 0.9,
      height: 100,
      color: Colors.red,


    );
  }
}