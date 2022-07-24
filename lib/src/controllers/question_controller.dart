import 'package:eie_mobile_app/src/models/question_model.dart';
import 'package:eie_mobile_app/src/services/question_provider.dart';
import 'package:eie_mobile_app/src/services/question_service.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController{
  QuestionService service = QuestionService();
  // final questionProvider = Get.find<QuestionProvider>();
  var questionList = <Question>[].obs;

  QuestionController(){
    getQuestions();
  }
  void getQuestions() async{
    var questions = await service.getQuestions();
    if (questions != null) {
      questionList.addAll(questions);
    }
  }

  // Future getQuestionProvider() async{
  //   final questions = await questionProvider.getQuestions();
  //   questionList.addAll(questions);
  // }
}