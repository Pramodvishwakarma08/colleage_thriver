import '../controller/choose_your_college_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ChooseYourCollegeScreen.
///
/// This class ensures that the ChooseYourCollegeController is created when the
/// ChooseYourCollegeScreen is first loaded.
class ChooseYourCollegeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseYourCollegeController());
  }
}
