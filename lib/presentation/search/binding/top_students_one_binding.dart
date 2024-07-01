import '../controller/top_students_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the TopStudentsOneScreen.
///
/// This class ensures that the TopStudentsOneController is created when the
/// TopStudentsOneScreen is first loaded.
class TopStudentsOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TopStudentsOneController());
  }
}
