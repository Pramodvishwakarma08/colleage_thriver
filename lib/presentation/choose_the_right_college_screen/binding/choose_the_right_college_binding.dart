import '../controller/choose_the_right_college_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ChooseTheRightCollegeScreen.
///
/// This class ensures that the ChooseTheRightCollegeController is created when the
/// ChooseTheRightCollegeScreen is first loaded.
class ChooseTheRightCollegeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseTheRightCollegeController());
  }
}
