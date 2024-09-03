import '../controller/get_your_college_matches_controller.dart';
import 'package:get/get.dart';

/// A binding class for the GetYourCollegeMatchesScreen.
///
/// This class ensures that the GetYourCollegeMatchesController is created when the
/// GetYourCollegeMatchesScreen is first loaded.
class GetYourCollegeMatchesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetYourCollegeMatchesController());
  }
}
