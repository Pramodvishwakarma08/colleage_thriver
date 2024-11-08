import '../controller/choose_the_right_college_controller.dart';
import 'package:get/get.dart';

class ChooseTheRightCollegeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseTheRightCollegeController());
  }
}
