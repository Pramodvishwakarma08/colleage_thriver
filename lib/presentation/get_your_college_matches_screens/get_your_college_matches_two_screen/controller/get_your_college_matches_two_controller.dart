import 'dart:convert';
import 'package:colleage_thriver/core/app_export.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/progress_dialog_utils.dart';
import '../../../../data/data_sources/remote/apI_endpoint_urls.dart';
import '../../../../data/data_sources/remote/api_client.dart';
import '../../get_your_college_matches_screen/models/get_your_college_matches_model.dart';

/// A controller class for the GetYourCollegeMatchesTwoScreen.
///
/// This class manages the state of the GetYourCollegeMatchesTwoScreen, including the
/// current getYourCollegeMatchesTwoModelObj
class GetYourCollegeMatchesTwoController extends GetxController {
  TextEditingController plannedMajorsController = TextEditingController();
  TextEditingController fratSororitiesClubsSportsController = TextEditingController();

  Rx<bool> privateUniversity = false.obs;

  Rx<bool> stateSchool = false.obs;

  Rx<bool> twoYearCommunity = false.obs;

  Rx<bool> tradeSchool = false.obs;

  @override
  void onInit() {
    super.onInit();
    getYourCollegeMatches();
  }

  @override
  void onClose() {
    super.onClose();
    plannedMajorsController.dispose();
    fratSororitiesClubsSportsController.dispose();
  }


  RxBool isLoadingUpdateCollegeMatchOne = false.obs;
  Future<void> updateCollegeMatchesTwo() async {
    isLoadingUpdateCollegeMatchOne(true);





    List<String> ethnicity =[];
    if(privateUniversity.value){
      ethnicity.add('"Private University"');
    }
    if(stateSchool.value){
      ethnicity.add('"State School"');
    }
    if(twoYearCommunity.value){
      ethnicity.add('"Two Year Community College"');
    }
    if(tradeSchool.value){
      ethnicity.add('"Trade School"');
    }





    var data = {
      'planned_major': '${plannedMajorsController.text}',
      'social_activity': '${fratSororitiesClubsSportsController.text}',
        'attendtype': '$ethnicity',
    };
    try {
      var response = await ApiClient()
          .postRequest(endPoint: AppUrls.collegeMatchThree, body: data);
      if (response.statusCode == 200) {
        isLoadingUpdateCollegeMatchOne(false);
        Get.toNamed(
          AppRoutes.getYourCollegeMatchesOneScreen,
          //GetYourCollegeMatchesOneScreen
        );
      //  AppDialogUtils.showToast(message: '${response.data["message"]}');
      } else {
        isLoadingUpdateCollegeMatchOne.value = false;
      }
    } catch (e) {
      isLoadingUpdateCollegeMatchOne.value = false;
      AppDialogUtils.showToast(message: '${e.toString()}');
      print("catch(e)==>${e.toString()}");
    }
  }

  List<String> ? list;

  GetyourCollegeMatchesModel? getYourCollegeMatchesModel;
  RxBool isLoadingCollegeGetMatchOne = false.obs;
  Future<void> getYourCollegeMatches() async {
    isLoadingCollegeGetMatchOne(true);
    try {
      var response = await ApiClient().getRequest(
        endPoint: AppUrls.getCollegeMatchAll,
      );
      if (response.statusCode == 200) {
        plannedMajorsController.text = GetyourCollegeMatchesModel.fromJson(response.data).allPoints![0].plannedMajor ?? "";
        fratSororitiesClubsSportsController.text = GetyourCollegeMatchesModel.fromJson(response.data).allPoints![0].socialActivities ?? "";
        String ? ethnicity =  GetyourCollegeMatchesModel.fromJson(response.data).allPoints![0].attendType ?? null;
        if(ethnicity != null){
          list = jsonDecode(ethnicity).cast<String>();
        }

        try{
          privateUniversity.value = list?.contains("Private University")?? false;
          stateSchool.value = list?.contains("State School")?? false;
          tradeSchool.value = list?.contains("Two Year Community College")?? false;
          twoYearCommunity.value = list?.contains("Trade School")?? false;

        }catch(e){
          print("PrivatePrivate");
          print(e.toString());
          print("PrivatePrivate");
        }

        isLoadingCollegeGetMatchOne.value = false;
      } else {
        isLoadingCollegeGetMatchOne.value = false;
        AppDialogUtils.showToast(message: '${response.statusCode}');
      }
    } catch (e, line) {
      // isLoadingCollegeGetMatchOne.value = false;
      AppDialogUtils.showToast(message: '${e.toString()}');
      print("catch(e)==>${e.toString()}");
      // ignore: unnecessary_brace_in_string_interps
      print("catch(e)==>${line}");
    }
  }
















}
