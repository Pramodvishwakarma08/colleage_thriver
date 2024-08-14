import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/presentation/notes/you_awesome_screen.dart';
import 'package:colleage_thriver/presentation/splash_screen/models/splash_model.dart';
import 'package:flutter/material.dart';
import 'package:jailbreak_root_detection/jailbreak_root_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;

  @override
  Future<void> onReady() async {
    Future.delayed(const Duration(milliseconds: 1000), () async {


      // final isNotTrust = await JailbreakRootDetection.instance.isNotTrust;
      // final isJailBroken = await JailbreakRootDetection.instance.isJailBroken;
      // final isRealDevice = await JailbreakRootDetection.instance.isRealDevice;
      // final isOnExternalStorage = await JailbreakRootDetection.instance.isOnExternalStorage;
      // final checkForIssues = await JailbreakRootDetection.instance.checkForIssues;
      // final isDevMode = await JailbreakRootDetection.instance.isDevMode;
      //


      //  Get.to(() => TodoList());
      // isOnboarding

      // isLoggedIn
      // // default

      SharedPreferences prefs = await SharedPreferences.getInstance();
      print("isLoggedIn ==>${prefs.get('isLoggedIn')}");
      bool isLoggedIn = prefs.get('isLoggedIn') == true ? true : false;

      bool isOnboarding = prefs.get('isOnboarding') == true ? false : true;
      print("isOnboarding ==>${prefs.get('isOnboarding')}");

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

class WaringScreen extends StatelessWidget {
  String waring ;
   WaringScreen({super.key,required this.waring});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Warning",
              style: TextStyle(fontSize: 50),
            ),  Text(
              "${waring}",
              style: TextStyle(fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}
