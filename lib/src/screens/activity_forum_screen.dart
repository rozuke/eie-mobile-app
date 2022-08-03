import 'package:eie_mobile_app/src/controllers/activity_controller.dart';
import 'package:eie_mobile_app/src/controllers/user_controller.dart';
import 'package:eie_mobile_app/src/models/forum_model.dart';
import 'package:eie_mobile_app/src/screens/forum_comments_screen.dart';
import 'package:eie_mobile_app/src/services/activity_service.dart';
import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:eie_mobile_app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityForumScreen extends StatelessWidget {

  static const nameRoute = '/activity-forum';

  final activityController = Get.find<ActivityController>();
  final userController = Get.find<UserController>();
  final activityService = Get.find<ActivityService>();
  ActivityForumScreen({Key? key}) : super(key: key);

  bool firstRequest = true;
  void viewCommentsForum(BuildContext context) {
    Navigator.pushNamed(context, ForumCommentsScreen.nameRoute);
  }
  void fetchForumTopics() async {
    final result = await activityService.getForumsTopic(userController.getCourse.cursoId) ;
    
    activityController.showLoading();
    if (activityController.isFirstRequest.isTrue) {
    activityController.topics.addAll(result);
    activityController.isFirstRequest.toggle();
    }
    activityController.hideLoading();
  }
  @override
  Widget build(BuildContext context) {
    fetchForumTopics();
    print(activityController.topics.length);
    return Scaffold(
      appBar: CustomAppBar(title: 'Forums'),
      body: Obx(() {

        return activityController.isLoading.isTrue
        ? const Center(child: CircularProgressIndicator())
        : ListView.separated(
          itemCount: activityController.topics.length,
          itemBuilder: ( _ , index) => _ForumCard(
            forum: activityController.topics[index],
            onPressed: () => viewCommentsForum(context),
          ), 
          separatorBuilder: ( _ , __ ) => const Divider(indent: 20, endIndent: 20,), 
        );
        
      })
    );
  }
}

class _ForumCard extends StatelessWidget {
  
  final Forum forum;
  final void Function() onPressed;
  const _ForumCard({Key? key,
    required this.forum,
    required this.onPressed
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: onPressed,
        title: Text(forum.topico, style: TextStyle(fontSize: 18, color: ThemeApp.complementaryColor),),
        subtitle: Text(forum.descripcion, style: TextStyle(), overflow: TextOverflow.ellipsis,),
      ),
    );
  }
}