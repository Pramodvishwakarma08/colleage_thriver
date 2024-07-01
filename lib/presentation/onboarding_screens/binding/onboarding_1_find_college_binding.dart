import '../controller/onboarding_1_find_college_controller.dart';
import 'package:get/get.dart';

class Onboarding1FindCollegeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Onboarding1FindCollegeController());
  }
}
