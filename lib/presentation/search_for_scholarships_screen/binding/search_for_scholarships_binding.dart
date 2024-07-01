import '../controller/search_for_scholarships_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SearchForScholarshipsScreen.
///
/// This class ensures that the SearchForScholarshipsController is created when the
/// SearchForScholarshipsScreen is first loaded.
class SearchForScholarshipsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchForScholarshipsController());
  }
}
