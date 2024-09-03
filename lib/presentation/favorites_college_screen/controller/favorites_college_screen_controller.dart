import 'package:colleage_thriver/core/app_export.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/progress_dialog_utils.dart';
import '../../../data/data_sources/remote/apI_endpoint_urls.dart';
import '../../../data/data_sources/remote/api_client.dart';
import '../../search/models/CollegeDetailListModel.dart';

class FavoritesCollegeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxBool isLoading = false.obs;
  CollegeDetailListModel favrateCollegeList = CollegeDetailListModel();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCollegeDetailList();
  }

  Future<void> getCollegeDetailList() async {
    isLoading.value = true;
    try {
      print("getCollegeDetailList");
      var response =
          await ApiClient().getRequest(endPoint: AppUrls.getFavCollege);
      favrateCollegeList = CollegeDetailListModel.fromJson(response.data);
      print("getCollegeDetailList");
      isLoading.value = false;

      if (response.statusCode == 200) {
        try {
          favrateCollegeList = CollegeDetailListModel.fromJson(response.data);
        } catch (e, log) {
          print("pramdiffdf${e.toString()}");
          print("pramdiffdf${log}");
        }
      }
    } catch (e, line) {
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
