import '../controller/tell_us_about_yourself_controller.dart';
import 'package:get/get.dart';

/// A binding class for the TellUsAboutYourselfScreen.
///
/// This class ensures that the TellUsAboutYourselfController is created when the
/// TellUsAboutYourselfScreen is first loaded.
class TellUsAboutYourselfBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TellUsAboutYourselfController());
  }
}
