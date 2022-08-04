import 'package:eie_mobile_app/src/controllers/activity_controller.dart';
import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eie_mobile_app/src/data/group_image.dart';


class ImageGrid extends StatelessWidget {
  final double spaceElements;
  final int condition;
  final List<GroupImage> options;
  final activityController = Get.find<ActivityController>();
  ImageGrid({Key? key, required this.spaceElements, required this.options, required this.condition}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

  
      
      return GridView.builder(
        shrinkWrap: true,
        primary: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.3,
          mainAxisSpacing: spaceElements

        ),
        padding: EdgeInsets.symmetric(horizontal: spaceElements / 2),
        itemCount: options.length,
        itemBuilder: ( _ , index) => GestureDetector(
          onTap: () {
            
            if (activityController.answer.length < condition) {
              activityController.setAnswer(options[index].isCorrect);

            } else {
              activityController.getAnswer().removeLast();
              activityController.setAnswer(options[index].isCorrect);
            }
            activityController.setDescription = options[index].description;

          },
          child: InkWell(
            highlightColor: ThemeApp.secondaryYellowColor.withOpacity(0.3),
            child: Image.network(options[index].imageURL,width: 200, height: 180, ),
          ),
        ));
   
  }
}
