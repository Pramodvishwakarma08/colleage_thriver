import '../controller/join_extracurriculars_controller.dart';
import 'package:get/get.dart';

/// A binding class for the JoinExtracurricularsScreen.
///
/// This class ensures that the JoinExtracurricularsController is created when the
/// JoinExtracurricularsScreen is first loaded.
class JoinExtracurricularsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JoinExtracurricularsController());
  }
}
