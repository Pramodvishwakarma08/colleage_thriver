import '../controller/meet_counselor_or_advisor_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MeetCounselorOrAdvisorScreen.
///
/// This class ensures that the MeetCounselorOrAdvisorController is created when the
/// MeetCounselorOrAdvisorScreen is first loaded.
class MeetCounselorOrAdvisorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MeetCounselorOrAdvisorController());
  }
}
