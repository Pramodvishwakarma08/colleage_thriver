import '../controller/take_career_assessment_controller.dart';
import 'package:get/get.dart';

/// A binding class for the TakeCareerAssessmentScreen.
///
/// This class ensures that the TakeCareerAssessmentController is created when the
/// TakeCareerAssessmentScreen is first loaded.
class TakeCareerAssessmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TakeCareerAssessmentController());
  }
}
