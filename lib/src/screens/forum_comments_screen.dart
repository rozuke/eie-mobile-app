import 'package:flutter/material.dart';
import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:eie_mobile_app/src/widgets/widgets.dart';

class ForumCommentsScreen extends StatelessWidget {
  
  static const nameRoute = '/forum-comments';

  const ForumCommentsScreen({Key? key}) : super(key: key);
  
  

  @override
  Widget build(BuildContext context) {

    final List<String> comments = [
      'Esse voluptate commodo adipisicing  Qui velit ut ut cupidatat proident ex labore. Velit proident anim cupidatat sint sunt reprehenderit. Lorem sit dolore mollit ullamco veniam ea labore ex. Consequat veniam nostrud magna non esse laborum deserunt duis est amet aute minim.',
      'Esse voluptate laborum deserunt minim. Magna voluptate excepteur commodo sint. Qui velit ut ut cupidatat proident ex labore. Velit proident anim cupidatat sint sunt reprehenderit. Lorem sit dolore mollit ullamco veniam ea labore ex. Consequat veniam nostrud magna non esse laborum deserunt duis est amet aute minim.',
      'Esse voluptate commodo adipisicing labore nostrud sit eiusmod ullamco amet laborum deserunt minim. Magna voluptate excepteur commodo sint. Qui velit ut ut cupidatat proident ex labore. Velit proident anim cupidatat sint sunt reprehenderit. Lorem sit dolore mollit ullamco veniam ea labore ex. Consequat veniam nostrud magna non esse laborum deserunt duis est amet aute minim.',
      'Esse voluptate ut cupidatat proident ex labore. Velit proident anim cupidatat sint sunt reprehenderit. Lorem sit dolore mollit ullamco veniam ea labore ex. Consequat veniam nostrud magna non esse laborum deserunt duis est amet aute minim.',
      'Esse voluptate ex labore. Velit proident anim cupidatat sint sunt reprehenderit. Lorem sit dolore mollit ullamco veniam ea labore ex. Consequat veniam nostrud magna non esse laborum deserunt duis est amet aute minim.',
      'Esse voluptate commodo adipisicing labore nostrud sit eiusmod ullamco amet laborum deserunt minim. Magna voluptate excepteur commodo sint. Qui velit ut ut cupidatat proident ex labore. Velit proident anim cupidatat sint sunt reprehenderit. Lorem sit dolore mollit ullamco veniam ea labore ex. Consequat veniam nostrud magna non esse laborum deserunt duis est amet aute minim.',
      'Esse voluptate commodo adipisicing labore nostrud sit eiusmod ullamco amet laborum deserunt minim. Magna voluptate excepteur commodo sint. Qui velit ut ut cupidatat proident ex labore. Velit proident anim cupidatat sint sunt reprehenderit. Lorem sit dolore mollit ullamco veniam ea labore ex. Consequat veniam nostrud magna non esse laborum deserunt duis est amet aute minim.',
  ];
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(child: _BoxTopic(title: 'Study by day or at night', description: 'Non tempor nulla incididunt veniam. Deserunt veniam minim laboris id adipisicing aliquip reprehenderit. Excepteur cupidatat id aliquip deserunt id incididunt incididunt ad laborum esse. Ut sunt ad amet pariatur aliqua labore duis qui elit.')),
          
              ConstrainedBox(
                constraints: BoxConstraints(
                minHeight: 100
                  ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: comments.map((comment) => _BoxComment(comment: comment)).toList(),
                ),
              ),
              SizedBox(height: 80,)  // ListView.builder( //   itemBuilder: itemBuilder),
              ],
            ),
          ),
        Positioned(
          
          right: 0,
          left: 0,
          bottom: 0,
          child: _BoxMessage()
        ),
        ],
      ),
      );
  }
}

class _BoxMessage extends StatefulWidget {
  _BoxMessage({Key? key}) : super(key: key);

  @override
  State<_BoxMessage> createState() => __BoxMessageState();
}

class __BoxMessageState extends State<_BoxMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _InputComment(hintText: 'Type your opinion', inputType: TextInputType.text, ),
          MaterialButton(
            onPressed: (){},
            color: ThemeApp.primaryBlueColor,
            shape: CircleBorder(),
            padding: EdgeInsets.all(10),
            child: Icon(Icons.send, color: Colors.white,),
          )
        ],
      ),
    );
  }
}


class _BoxTopic extends StatelessWidget {
  final String title;
  final String description;
  const _BoxTopic({Key? key,
    required this.title,
    required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      margin: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserInfo(
          userName: 'Gabriel Gongora',
          userRol: 'Teacher',
          textAvatar: 'J',
        ),

        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: ThemeApp.complementaryColor),),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: Text(description,
                                style: TextStyle(color: ThemeApp.primaryBlueColor),)
                  ),
                ] 
              ),      
            ],
          ),
        ),
        
        ],
      ),
    );
  }
}

class _BoxComment extends StatelessWidget {
  final String comment;
  const _BoxComment({Key? key,
    required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.only(bottom: 10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          UserInfo(
          userName: 'Juan Perez',
          userRol: 'Student',
          textAvatar: 'J',
        ),

        Container(
            margin: EdgeInsets.symmetric(horizontal: 20, ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
                Row(
                  children: [
                    Expanded(
                      child: Text(comment,)
                    ),
                    
                  ] 
                ),      
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InputComment extends StatelessWidget {

  final String hintText;
  final TextInputType inputType;
  
  
  const _InputComment({
    Key? key,
    required this.hintText,
    required this.inputType,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
            width: width * 0.8,
            child: TextFormField(
              autocorrect: false,
              keyboardType: inputType,
              decoration: _InputDecorations.inputLoginDecoration(
                hintText: hintText,
                )
            ),
          );
  }
}

class _InputDecorations {
  static InputDecoration inputLoginDecoration({
    required String hintText,
    IconData? prefixIcon
  }){
    return InputDecoration(
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(30)
      ),
      hintText: hintText,
      hintStyle: const TextStyle(
        color: ThemeApp.lightBlueColor,
        ),
      prefixIcon: prefixIcon != null 
        ?Icon(prefixIcon, color: ThemeApp.primaryBlueColor,)
        :null,
      filled: true,
      fillColor: Colors.white
    );
  }
}


