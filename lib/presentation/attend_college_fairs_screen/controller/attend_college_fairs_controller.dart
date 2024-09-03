import 'package:colleage_thriver/core/app_export.dart';
// ignore: unused_import
import 'package:colleage_thriver/presentation/attend_college_fairs_screen/models/attend_college_fairs_model.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/progress_dialog_utils.dart';
import '../../../data/data_sources/remote/apI_endpoint_urls.dart';
import '../../../data/data_sources/remote/api_client.dart';
import '../../get_your_college_matches_screens/get_your_college_matches_screen/models/get_your_college_matches_model.dart';

/// A controller class for the AttendCollegeFairsScreen.
///
/// This class manages the state of the AttendCollegeFairsScreen, including the
/// current attendCollegeFairsModelObj
class AttendCollegeFairsController extends GetxController {
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
      'college_fair_21': '${nameController.text}'
    };
    try {
      var response = await ApiClient()
          .postRequest(endPoint: AppUrls.college_2_of_05, body: data);
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
        nameController.text = GetyourCollegeMatchesModel.fromJson(response.data).allPoints![0].activity21 ?? "";


      } else {
        AppDialogUtils.showToast(message: '${response.statusCode}');
      }
    } catch (e, line) {
      AppDialogUtils.showToast(message: '${e.toString()}');
      print("catch(e)==>${e.toString()}");
      // ignore: unnecessary_brace_in_string_interps
      print("catch(e)==>${line}");
    }
  }


}