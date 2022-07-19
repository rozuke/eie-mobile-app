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
            padding: EdgeInsets.only(left: 10),
            child: ListTile(
              leading: Icon(Icons.newspaper, color: ThemeApp.secondaryYellowColor),
              title: Text('Information', style: TextStyle(fontSize: 18),),
            )
          ),
          
          _CourseInfo(),

          Padding(
            padding: EdgeInsets.only(left: 10),
            child: ListTile(
              leading: Icon(Icons.newspaper, color: ThemeApp.secondaryYellowColor),
              title: Text('Level basic books', style: TextStyle(fontSize: 18),),
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

    final info = [{
      'icon' : Icons.book_outlined,
      'title' : 'Current Book',
      'subtitle' : ['Book 1', 'Level 1']
    }, 
    {
      'icon' : Icons.chrome_reader_mode_rounded,
      'title' : 'Current Book',
      'subtitle' : ['Book 1', 'Level 1']
    }
    ];
    
    return Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _InfoBookCard(
          title: 'Curren Book',
          description: ['Book 1', 'Level 1'],
          icon: Icons.book_outlined
        ),
        SizedBox(width: 5,),
        _InfoBookCard(
          title: 'Lessos',
          description: ['Lesson 1', 'Bobs a Barber', 'Lesson 3', 'Lesson 4'],
          icon: Icons.chrome_reader_mode_outlined
        ),
      ],
    );
  }
}

class _InfoBookCard extends StatelessWidget {
  final String title;
  final List<String> description;
  final IconData icon;
  const _InfoBookCard({
    Key? key, required this.title, required this.description, required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.4;
    return Container(
      height: 150,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: ThemeApp.complementaryColor, width: 2),
        borderRadius: BorderRadius.circular(10)
      ),
      child: ListTile(
        leading: Icon(icon, color: ThemeApp.secondaryYellowColor),
        title: Text( title, style: TextStyle(fontSize: 16),),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: description.map((subtitle) => Text(subtitle, style: TextStyle(color: ThemeApp.secondaryBlueColor),)).toList(),
      )
      )
    
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


// Before course info
// child: SingleChildScrollView(
//             child: ExpansionPanelList.radio(
//               dividerColor: ThemeApp.complementaryColor,
//               children: 
//                 listTiles.map((tile) => ExpansionPanelRadio(
//                   canTapOnHeader: true,
//                   value: tile.title,
//                   headerBuilder: ( _ , isExpanded) =>buildTile(tile),
//                   body: Column(
//                     children: tile.tiles.map(buildTile).toList(),
//                   ))).toList(),
//             ),
//           ),