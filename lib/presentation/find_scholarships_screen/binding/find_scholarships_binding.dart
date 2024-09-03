import '../controller/find_scholarships_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FindScholarshipsScreen.
///
/// This class ensures that the FindScholarshipsController is created when the
/// FindScholarshipsScreen is first loaded.
class FindScholarshipsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FindScholarshipsController());
  }
}
