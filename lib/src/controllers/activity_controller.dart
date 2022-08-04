import 'package:eie_mobile_app/src/models/result_model.dart';
import 'package:eie_mobile_app/src/services/activity_service.dart';
import 'package:eie_mobile_app/src/widgets/image_grid.dart';
import 'package:get/get.dart';

import '../models/forum_model.dart';

class ActivityController extends GetxController{

  final activityService = Get.find<ActivityService>();

  final topics = <Forum>[].obs;
  final results = <Result>[].obs;
  RxBool isLoading = false.obs ;
  RxBool isFirstRequest = true.obs;
  
  List<bool> answer = [];
  int rightAnswers = 0;
  String description = '';

  void setAnswer ( bool value ){
    answer.add(value);
    value? rightAnswers++ : null;
    update();
  }

  List<bool> getAnswer (){
    return answer;
  }

  set setResult( Result newResult){
    if (newResult != null){
      results.add(newResult);
      
    }
  }

    
  get getResult{
    if (results.isNotEmpty){
    return results.last;
    }
  } 

  set setDescription ( String value ){
    description = value;
  }
  get getDescription => description;

  set setForums(List<Forum> forums){
    showLoading();
    topics.addAll(forums);
    hideLoading();
  }

  loadForumTopics(int courseId) async {
    
    final result = await activityService.getForumsTopic(courseId);
    

    if (result.isNotEmpty) {
      print("Resultado deontro de la condicion ${result.length}");
      topics.addAll(result) ;
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
