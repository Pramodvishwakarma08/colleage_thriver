import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/progress_dialog_utils.dart';
import '../../../data/data_sources/remote/apI_endpoint_urls.dart';
import '../../../data/data_sources/remote/api_client.dart';
import '../../get_your_college_matches_screens/get_your_college_matches_screen/models/get_your_college_matches_model.dart';

///
/// This class manages the state of the CreateAShortlistScreen, including the
/// current createAShortlistModelObj
class CreateAShortlistController extends GetxController {
  TextEditingController nameController = TextEditingController();





  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getYourCollegeMatches();
  }


  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
  }













  RxBool isLoadingUpdateCollegeMatchOne = false.obs;

  Future<void> updateCollefefairs() async {
    isLoadingUpdateCollegeMatchOne(true);


    var data = {
      'shortlist_32': '${nameController.text}'
    };
    try {
      var response = await ApiClient()
          .postRequest(endPoint: AppUrls.scholar_02, body: data);
      if (response.statusCode == 200) {
        isLoadingUpdateCollegeMatchOne(false);
        Get.back();
        AppDialogUtils.showToast(message: '${response.data["message"]}');
      } else {
        isLoadingUpdateCollegeMatchOne.value = false;
      }
    } catch (e) {
      isLoadingUpdateCollegeMatchOne.value = false;
      AppDialogUtils.showToast(message: '${e.toString()}');
      print("catch(e)==>${e.toString()}");
    }
  }

  // List<String> ? list;

  GetyourCollegeMatchesModel? getYourCollegeMatchesModel;
  Future<void> getYourCollegeMatches() async {
    try {
      var response = await ApiClient().getRequest(
        endPoint: AppUrls.getCollegeMatchAll,
      );
      if (response.statusCode == 200) {
        nameController.text = GetyourCollegeMatchesModel.fromJson(response.data).allPoints![0].activity32 ?? "";


      } else {
        AppDialogUtils.showToast(message: '${response.statusCode}');
      }
    } catch (e, line) {
      AppDialogUtils.showToast(message: '${e.toString()}');
      print("catch(e)==>${e.toString()}");
      print("catch(e)==>${line}");
    }
  }



}
