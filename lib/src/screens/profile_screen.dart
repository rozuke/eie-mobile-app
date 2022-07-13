import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:eie_mobile_app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
   
  const ProfileScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Profile'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _ProfileInfo(),
          
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: ListTile(
              leading: Icon(Icons.newspaper, color: ThemeApp.secondaryYellowColor),
              title: Text('Level basic books', style: TextStyle(fontSize: 20),),
            )
          ),
          
          _CourseInfo(),

          Padding(
            padding: EdgeInsets.only(left: 20),
            child: ListTile(
              leading: Icon(Icons.newspaper, color: ThemeApp.secondaryYellowColor),
              title: Text('Level basic books', style: TextStyle(fontSize: 20),),
            )
          ),

          _ALCScoreInfo()
          
        ],
      ),
    );
  }
}


class _ALCScoreInfo extends StatelessWidget {
  const _ALCScoreInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: ThemeApp.complementaryColor, width: 2),
          borderRadius: BorderRadius.circular(10)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ScoreCard(title: 'Laboratory', score: 80, percentage: 0.5, color: ThemeApp.skillColorLab, icon: Icons.headphones,),
              Divider(color: ThemeApp.complementaryColor,height: 2),
              ScoreCard(title: 'Evaluation Exercise', score: 80, percentage: 0.5, color: ThemeApp.skillColorEE, icon: Icons.assignment,),
              Divider(color: ThemeApp.complementaryColor,height: 2),
              ScoreCard(title: 'Homework', score: 80, percentage: 0.5, color: ThemeApp.skillColorHW, icon: Icons.create,),
            ],
          ),
        ),
      ),
    );
  }
}

class _CourseInfo extends StatefulWidget {
  const _CourseInfo({Key? key}) : super(key: key);

  @override
  State<_CourseInfo> createState() => _CourseInfoState();
}

class _CourseInfoState extends State<_CourseInfo> {
  @override
  Widget build(BuildContext context) {

    final List<ExpandedTile> listTiles = [
      ExpandedTile(title: 'Book 1', icon: Icons.menu_book_rounded, tiles: [
        ExpandedTile(title: 'Lesson 1'),
        ExpandedTile(title: 'Lesson 2'),
        ExpandedTile(title: 'Lesson 3'),
        ExpandedTile(title: 'Lesson 4'),
      ]),
      ExpandedTile(title: 'Book 2', icon: Icons.menu_book_rounded, tiles: [
        ExpandedTile(title: 'Lesson 1'),
        ExpandedTile(title: 'Lesson 2'),
        ExpandedTile(title: 'Lesson 3'),
        ExpandedTile(title: 'Lesson 4'),
      ]),
      ExpandedTile(title: 'Book 3', icon: Icons.menu_book_rounded, tiles: [
        ExpandedTile(title: 'Lesson 1'),
        ExpandedTile(title: 'Lesson 2'),
        ExpandedTile(title: 'Lesson 3'),
        ExpandedTile(title: 'Lesson 4'),
      ]),
      ExpandedTile(title: 'Book 4', icon: Icons.menu_book_rounded, tiles: [
        ExpandedTile(title: 'Lesson 1'),
        ExpandedTile(title: 'Lesson 2'),
        ExpandedTile(title: 'Lesson 3'),
        ExpandedTile(title: 'Lesson 4'),
      ]),
      ExpandedTile(title: 'Book 5', icon: Icons.menu_book_rounded, tiles: [
        ExpandedTile(title: 'Lesson 1'),
        ExpandedTile(title: 'Lesson 2'),
        ExpandedTile(title: 'Lesson 3'),
        ExpandedTile(title: 'Lesson 4'),
      ]),
      ExpandedTile(title: 'Book 6', icon: Icons.menu_book_rounded, tiles: [
        ExpandedTile(title: 'Lesson 1'),
        ExpandedTile(title: 'Lesson 2'),
        ExpandedTile(title: 'Lesson 3'),
        ExpandedTile(title: 'Lesson 4'),
      ])
    ];

    
    return Flexible(
      child: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: ThemeApp.complementaryColor, width: 2),
          borderRadius: BorderRadius.circular(10)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SingleChildScrollView(
            child: ExpansionPanelList.radio(
              dividerColor: ThemeApp.complementaryColor,
              children: 
                listTiles.map((tile) => ExpansionPanelRadio(
                  canTapOnHeader: true,
                  value: tile.title,
                  headerBuilder: ( _ , isExpanded) =>buildTile(tile),
                  body: Column(
                    children: tile.tiles.map(buildTile).toList(),
                  ))).toList(),
            ),
          ),
        ),
        
        
      ),
    );
  }
}

Widget buildTile( ExpandedTile tile ) => ListTile(
  leading: tile.icon != null
    ? Icon(tile.icon, color: ThemeApp.secondaryBlueColor)
    : null,
  title: Text(tile.title),
);


class _ProfileInfo extends StatelessWidget {
  const _ProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.lightBlue[300],
            child: Text('RE', style: TextStyle(color: Colors.white))
          ),
          title: Text('Rodrigo Estiven Sulca Acosta', style: TextStyle(color: ThemeApp.primaryBlueColor, fontSize: 20),),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Student', style: TextStyle(color: ThemeApp.primaryBlueColor),),
              Text('rodrigo@gmail.com', style: TextStyle(color: ThemeApp.secondaryBlueColor),)
            ],
          ),

        ),
      ),
    );
  }
}


class ExpandedTile {
  final String title;
  final IconData? icon;
  final List<ExpandedTile> tiles;
  bool isExpanded;

  ExpandedTile({
    required this.title,
    this.icon,
    this.tiles = const [],
    this.isExpanded = false,
  });
}