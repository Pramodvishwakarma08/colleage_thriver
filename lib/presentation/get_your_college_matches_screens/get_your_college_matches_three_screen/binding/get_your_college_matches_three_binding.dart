import '../controller/get_your_college_matches_three_controller.dart';
import 'package:get/get.dart';

/// A binding class for the GetYourCollegeMatchesThreeScreen.
///
/// This class ensures that the GetYourCollegeMatchesThreeController is created when the
/// GetYourCollegeMatchesThreeScreen is first loaded.
class GetYourCollegeMatchesThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetYourCollegeMatchesThreeController());
  }
}
