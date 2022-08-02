import 'package:eie_mobile_app/src/models/user_model.dart';
import 'package:eie_mobile_app/src/services/user_service.dart';
import 'package:get/get.dart';

class UserController extends GetxController {

  final userService = Get.find<UserService>();
  var user = <User>[].obs;

 

//  set setImage(String url) {
//     image = url;
//     update();
//  }
//  get getImage => image;

set setUser(User newUser){
  user.add(newUser);
}
User get getUser => user[0];

//  Future getUser(String email) async {
//     try{
//       final response = await user.getUser(email);
//       userData.add(response);
      
//     } on Exception catch (e) {
//       print(e);
//       rethrow;
//     }
//   }
}