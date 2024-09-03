import 'package:colleage_thriver/core/app_export.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/progress_dialog_utils.dart';
import '../../../data/data_sources/remote/apI_endpoint_urls.dart';
import '../../../data/data_sources/remote/api_client.dart';
import '../models/CollegeDetailListModel.dart';



class TopStudentsOneController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxBool   isLoading  =false.obs;
  CollegeDetailListModel  collegeDetailListModel = CollegeDetailListModel();


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCollegeDetailList("");
  }





  Future<void> getCollegeDetailList(String searchname) async{
    var data = {
      'searchname': '$searchname'
    };
    isLoading.value =true;
    try {
      print("getCollegeDetailList");
      var response = await ApiClient().postRequest(endPoint: AppUrls.collegeSearch, body:data);
      print("getCollegeDetailList");
      if (response.statusCode == 200) {
        isLoading.value =false;
        collegeDetailListModel =CollegeDetailListModel.fromJson(response.data);
      }
    } catch (e,line) {
      // isLoadingCollegeGetMatchOne.value = false;
      AppDialogUtils.showToast(message: '${e.toString()}');
      print("catch(e)==>${e.toString()}");
      print("catch(e)==>$line");
    }
  }



  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
