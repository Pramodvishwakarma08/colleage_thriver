import '../controller/get_your_college_matches_two_controller.dart';
import 'package:get/get.dart';

/// A binding class for the GetYourCollegeMatchesTwoScreen.
///
/// This class ensures that the GetYourCollegeMatchesTwoController is created when the
/// GetYourCollegeMatchesTwoScreen is first loaded.
class GetYourCollegeMatchesTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetYourCollegeMatchesTwoController());
  }
}
