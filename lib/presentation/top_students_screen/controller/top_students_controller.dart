import 'package:colleage_thriver/core/app_export.dart';

import '../../../core/utils/progress_dialog_utils.dart';
import '../../../data/data_sources/remote/apI_endpoint_urls.dart';
import '../../../data/data_sources/remote/api_client.dart';
import '../models/top_students_model.dart';

class TopStudentsController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTopStudents();

  }

RxBool   isLoadingCollegeGetMatchOne  =false.obs;

TopStudentModel ? topStudentModel;




  Future<void> getTopStudents() async{
    isLoadingCollegeGetMatchOne.value =true;
    try {
      var response = await ApiClient().getRequest(endPoint: AppUrls.getTopStudents,);
      if (response.statusCode == 200) {
        topStudentModel =TopStudentModel.fromJson(response.data);
        isLoadingCollegeGetMatchOne.value =false;
      }else{
        AppDialogUtils.showToast(message: "${response.data["message"]}");
      }
    } catch (e,line) {
      // isLoadingCollegeGetMatchOne.value = false;
      AppDialogUtils.showToast(message: '${e.toString()}');
      print("catch(e)==>${e.toString()}");
      // ignore: unnecessary_brace_in_string_interps
      print("catch(e)==>${line}");
    }
  }





}
