import 'package:eie_mobile_app/src/controllers/activity_controller.dart';
import 'package:eie_mobile_app/src/controllers/question_controller.dart';
import 'package:eie_mobile_app/src/controllers/user_controller.dart';
import 'package:eie_mobile_app/src/services/activity_service.dart';
import 'package:eie_mobile_app/src/services/user_service.dart';
import 'package:eie_mobile_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:eie_mobile_app/src/screens/screens.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final activityService = Get.put(ActivityService());
  final activityController = Get.put(ActivityController());
  final userService = Get.find<UserService>();
  final controller = Get.find<UserController>();
  static const nameRoute = '/home';
  HomeScreen({Key? key}) : super(key: key);
  
  fetchCourse() async{
    final course = await userService.getCourse(controller.getUser.usuarioId);
    controller.setCourse = course;
    print(course.cursoId);
  }

  fetchResult() async {
    final result = await activityService.getStudentResult(controller.getUser.usuarioId);
    activityController.setResult = result;
    print(result);
  }
  @override
  Widget build(BuildContext context) {
    fetchCourse();
    fetchResult();
    return ChangeNotifierProvider(
      create: ( _ ) => _NavegationModel(),
      child: Scaffold(
        body: _PagesHome(),
        bottomNavigationBar: _BottomNavBar(),
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavegationModel>(context);
    return BottomNavigationBar(
      currentIndex: navigationModel.currentPage,
      onTap: (i) => navigationModel.currentPage = i,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.library_books, size: 25,), label: 'Books', backgroundColor: Colors.white),
        BottomNavigationBarItem(icon: Icon(Icons.grid_view_sharp, size: 25), label: 'Activities', backgroundColor: Colors.white),
        BottomNavigationBarItem(icon: Icon(Icons.person, size: 25), label: 'Profile'),
      ],
      // backgroundColor: Colors.white
      backgroundColor: ThemeApp.primaryBlueColor,
      selectedItemColor: ThemeApp.primaryYellowColor);
  }
}



class _PagesHome extends StatelessWidget {
  const _PagesHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavegationModel>(context);
    return PageView(
      controller: navigationModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        BooksScreen(),
        ActivitiesScreen(),
        ProfileScreen(),
      ],
    );
  }
}


class _NavegationModel with ChangeNotifier {
  int _currentPage = 0;
  PageController _pageController = new PageController();
  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;

    _pageController.animateToPage(value, duration: Duration(milliseconds: 250), curve: Curves.easeInOut);

    notifyListeners();
  }

  PageController get pageController => _pageController;
}