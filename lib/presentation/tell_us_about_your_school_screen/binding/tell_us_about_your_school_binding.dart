import '../controller/tell_us_about_your_school_controller.dart';
import 'package:get/get.dart';

/// A binding class for the TellUsAboutYourSchoolScreen.
///
/// This class ensures that the TellUsAboutYourSchoolController is created when the
/// TellUsAboutYourSchoolScreen is first loaded.
class TellUsAboutYourSchoolBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TellUsAboutYourSchoolController());
  }
}
