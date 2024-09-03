import '../controller/attend_college_fairs_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AttendCollegeFairsScreen.
///
/// This class ensures that the AttendCollegeFairsController is created when the
/// AttendCollegeFairsScreen is first loaded.
class AttendCollegeFairsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AttendCollegeFairsController());
  }
}
