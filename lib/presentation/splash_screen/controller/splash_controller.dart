import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/presentation/notes/you_awesome_screen.dart';
import 'package:colleage_thriver/presentation/splash_screen/models/splash_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 1000), () async {
    //  Get.to(() => TodoList());
      // isOnboarding

      // isLoggedIn
      // // default

      SharedPreferences prefs = await SharedPreferences.getInstance();
      print("isLoggedIn ==>${ prefs.get('isLoggedIn')}");
      bool isLoggedIn = prefs.get('isLoggedIn') == true ? true : false;

      bool isOnboarding = prefs.get('isOnboarding') == true ? false : true;
      print("isOnboarding ==>${ prefs.get('isOnboarding')}");

      if (isLoggedIn) {
        Get.offNamed(
          AppRoutes.homeScreen,
        );
      } else if (isOnboarding) {
        Get.offNamed(
          AppRoutes.onboarding1FindCollegeScreen,
        );
      } else {
        Get.offNamed(
          AppRoutes.loginScreen,
        );
      }
    });
  }
}
