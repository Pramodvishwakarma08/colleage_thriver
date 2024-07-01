import '../controller/mentors_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MentorsScreen.
///
/// This class ensures that the MentorsController is created when the
/// MentorsScreen is first loaded.
class MentorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MentorsController());
  }
}
