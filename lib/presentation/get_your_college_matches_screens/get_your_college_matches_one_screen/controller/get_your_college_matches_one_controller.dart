import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';

import '../../../../core/utils/progress_dialog_utils.dart';
import '../../../../data/data_sources/remote/apI_endpoint_urls.dart';
import '../../../../data/data_sources/remote/api_client.dart';
import '../../get_your_college_matches_screen/models/get_your_college_matches_model.dart';

class GetYourCollegeMatchesOneController extends GetxController {


  TextEditingController householdincomeController = TextEditingController();

  String? AffilliationValue ;
  List<DropdownMenuItem<String>> AffilliationList = [
    const DropdownMenuItem(
      value: 'Yes',
      child: Text('Yes'),
    ), const DropdownMenuItem(
      value: 'No',
      child: Text('No'),
    ),

  ];



  Rx<bool> giMilitaryCheckBox = false.obs;
  Rx<bool> financialAidCheckBox = false.obs;
  Rx<bool> tuitionPlanCheckBox = false.obs;
  Rx<bool> scholarshipCheckBox = false.obs;




   @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getYourCollegeMatches();
  }

  RxBool isLoadingUpdateCollegeMatchOne = false.obs;
  Future<void> updateCollegeMatchesFour() async {
    isLoadingUpdateCollegeMatchOne(true);

    List<String> ethnicity =[];
    if(giMilitaryCheckBox.value){
      ethnicity.add('"GI/Military"');
    }
    if(financialAidCheckBox.value){
      ethnicity.add('"Finacial Aid"');
    }
    if(tuitionPlanCheckBox.value){
      ethnicity.add('"Tuition Plan"');
    }

    if(scholarshipCheckBox.value){
      ethnicity.add('"Scholarship"');
    }

    var data = {
      'householdincome': '${householdincomeController.text}',
      'military_affil': '$AffilliationValue',
      'paycollege': '$ethnicity'
    };


    try {
      var response = await ApiClient()
          .postRequest(endPoint: AppUrls.collegeMatchFour, body: data);
      if (response.statusCode == 200) {
        isLoadingUpdateCollegeMatchOne(false);
        Get.back();
        Get.back();
        Get.back();
        Get.back();
        Get.back();
        Get.toNamed(AppRoutes.chooseTheRightCollegeScreen);
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
        householdincomeController.text = GetyourCollegeMatchesModel.fromJson(response.data).allPoints![0].householdIncome ?? "";
        AffilliationValue = GetyourCollegeMatchesModel.fromJson(response.data).allPoints![0].militaryAffiliation ?? null;
        String ? ethnicity =  GetyourCollegeMatchesModel.fromJson(response.data).allPoints![0].payCollege;
        if(ethnicity != null){
          list = jsonDecode(ethnicity).cast<String>();
        }

        try{
          giMilitaryCheckBox.value = list?.contains("GI/Military")?? false;
          financialAidCheckBox.value = list?.contains("Finacial Aid")?? false;
          tuitionPlanCheckBox.value = list?.contains("Tuition Plan")?? false;
          scholarshipCheckBox.value = list?.contains("Scholarship")?? false;
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
      print("catch(e)==>$line");
    }
  }




















}
