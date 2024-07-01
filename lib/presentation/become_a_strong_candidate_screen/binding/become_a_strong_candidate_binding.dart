import '../controller/become_a_strong_candidate_controller.dart';
import 'package:get/get.dart';

/// A binding class for the BecomeAStrongCandidateScreen.
///
/// This class ensures that the BecomeAStrongCandidateController is created when the
/// BecomeAStrongCandidateScreen is first loaded.
class BecomeAStrongCandidateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BecomeAStrongCandidateController());
  }
}
