import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/presentation/find_scholarships_screen/models/find_scholarships_model.dart';

import '../../home_screen/controller/home_screen_controller.dart';

/// A controller class for the FindScholarshipsScreen.
///
/// This class manages the state of the FindScholarshipsScreen, including the
/// current findScholarshipsModelObj
class FindScholarshipsController extends GetxController {
  Rx<FindScholarshipsModel> findScholarshipsModelObj =
      FindScholarshipsModel().obs;



  HomePageCollegeController controller =Get.put(HomePageCollegeController());


  @override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete {
   print("onDelete222");
   controller.getProfile();
   return  super.onDelete;
  }
}
