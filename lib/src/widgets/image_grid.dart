import 'package:eie_mobile_app/src/controllers/activity_controller.dart';
import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ImageGrid extends StatelessWidget {
  final double spaceElements;
  final activityController = Get.find<ActivityController>();
  ImageGrid({Key? key, required this.spaceElements}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

  
      List<GroupImage> options = [
        GroupImage(imageURL: "https://dummyimage.com/200x180", description: "This is a pencil", isCorrect: true, isSelectect: false),
        GroupImage(imageURL: "https://dummyimage.com/200x180", description: "This is a clock", isCorrect: false, isSelectect: false),
        GroupImage(imageURL: "https://dummyimage.com/200x180", description: "This is a table", isCorrect: false, isSelectect: false),
        GroupImage(imageURL: "https://dummyimage.com/200x180", description: "This is a door", isCorrect: false, isSelectect: false),
      ];
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
            
            if (activityController.answer.isEmpty) {
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

class GroupImage {
  final String imageURL;
  final String description;
  final bool isCorrect;
  final bool isSelectect;

  GroupImage({
    required this.imageURL,
    required this.description,
    required this.isCorrect,
    required this.isSelectect,
  });

}