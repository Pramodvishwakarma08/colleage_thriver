import '../controller/get_your_college_matches_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the GetYourCollegeMatchesOneScreen.
///
/// This class ensures that the GetYourCollegeMatchesOneController is created when the
/// GetYourCollegeMatchesOneScreen is first loaded.
class GetYourCollegeMatchesOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetYourCollegeMatchesOneController());
  }
}
