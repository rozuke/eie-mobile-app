import 'package:eie_mobile_app/src/controllers/user_controller.dart';
import 'package:eie_mobile_app/src/models/comment_model.dart';
import 'package:eie_mobile_app/src/models/comment_response_model.dart';
import 'package:eie_mobile_app/src/models/forum_model.dart';
import 'package:eie_mobile_app/src/services/activity_service.dart';
import 'package:flutter/material.dart';
import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:eie_mobile_app/src/widgets/widgets.dart';
import 'package:get/get.dart';

class ForumCommentsScreen extends StatelessWidget {

  final CommentResponse data;
  static const nameRoute = '/forum-comments';

  ForumCommentsScreen({Key? key, required this.data}) : super(key: key);
  
  

  @override
  Widget build(BuildContext context) {
   

    if (data.comentarios.isEmpty) {
      return Scaffold(
        body: Center(
        child: Text('No comments yet'),
      )
      ) ;
    }
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(child: _BoxTopic(forum: data.foro,)),
          
              ConstrainedBox(
                constraints: const BoxConstraints(
                minHeight: 100
                  ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: data.comentarios.map((comment) => _BoxComment(comment: comment)).toList(),
                ),
              ),
              const SizedBox(height: 80,)  // ListView.builder( //   itemBuilder: itemBuilder),
              ],
            ),
          ),
        Positioned(
          
          right: 0,
          left: 0,
          bottom: 0,
          child: _BoxMessage(acitivityId: data.foro.actividadId,)
        ),
        ],
      )

      );
  }
}

class _BoxMessage extends StatelessWidget {
  
  final int acitivityId;
  final activityService = Get.find<ActivityService>();
  final userController = Get.find<UserController>();
  _BoxMessage({Key? key, required this.acitivityId}) : super(key: key);


TextEditingController commentController = TextEditingController();
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _InputComment(hintText: 'Type your opinion',
            inputType: TextInputType.text,
            controller: commentController,
          ),
          MaterialButton(
            onPressed: () async {
              String comment = commentController.text;
              if(comment.isNotEmpty) {
                final courseId = userController.getCourse.cursoId;
                final userId = userController.getUser.usuarioId;
                final Map<String, dynamic> data = {
                  'contenido': comment,
                  'usuarioId': userId,
                  'actividadId': acitivityId,
                };
                final response = activityService.postComment( courseId, acitivityId, data );
                
                if(response != null) {
                  await activityService.getComments(courseId, acitivityId);
                  commentController.clear();
                }
                
              }
            },
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
  Forum forum;
  _BoxTopic({Key? key,
    required this.forum
    }) : super(key: key);

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
        //   UserInfo(
        //   userName: 'Gabriel Gongora',
        //   userRol: 'Teacher',
        //   textAvatar: 'J',
        // ),
        const SizedBox(height: 30,),
        SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(forum.topico, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: ThemeApp.complementaryColor),),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: Text(forum.descripcion,
                                  style: const TextStyle(color: ThemeApp.primaryBlueColor),)
                    ),
                  ] 
                ),      
              ],
            ),
          ),
        ),
        
        ],
      ),
    );
  }
}

class _BoxComment extends StatelessWidget {
  final Comment comment;
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
          userName: comment.nombre,
          userRol: 'Student',
        ),

        Container(
            margin: EdgeInsets.symmetric(horizontal: 20, ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
                Row(
                  children: [
                    Expanded(
                      child: Text(comment.contenido)
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
  final TextEditingController controller;
  
  
  const _InputComment({
    Key? key,
    required this.hintText,
    required this.inputType,
    required this.controller,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
            width: width * 0.8,
            child: TextFormField(
              autocorrect: false,
              controller: controller,
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


