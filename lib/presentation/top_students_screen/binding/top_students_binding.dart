import '../controller/top_students_controller.dart';
import 'package:get/get.dart';

/// A binding class for the TopStudentsScreen.
///
/// This class ensures that the TopStudentsController is created when the
/// TopStudentsScreen is first loaded.
class TopStudentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TopStudentsController());
  }
}
