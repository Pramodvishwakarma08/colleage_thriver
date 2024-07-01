import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:colleage_thriver/core/app_export.dart';
import '../../../core/utils/progress_dialog_utils.dart';
import '../../../data/data_sources/remote/api_client.dart';
import '../../search/models/CollegeDetailListModel.dart';
import 'package:http/http.dart' as http;

class RecommendedCollegesOneController extends GetxController {
  // List<Map<String, dynamic>> institutions = [
  //   // Paste the JSON data here
  // ];

  List<Message> institutions = [];

  List<LatLng> latLngList = [];
  List<String> name = [];
  List<LatLng> photos = [];

  Uint8List? databtybs;

  // // Iterate through the institutions data
  // institutions.forEach((institution) {
  // double latitude = institution['latitude'];
  // double longitude = institution['longitude'];
  // latLngList.add(LatLng(latitude, longitude));
  // });
  //

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCollegeDetailList();
  }

  RxBool isLoading = false.obs;
  CollegeDetailListModel collegeDetailListModel = CollegeDetailListModel();

  Future<void> getCollegeDetailList() async {
    isLoading.value = true;
    try {
      print("getCollegeDetailList");
      var response = await ApiClient().getRequest(
        endPoint: "recommended-college",
      );
      print("getCollegeDetailList");
      if (response.statusCode == 200) {
        isLoading.value = false;
        collegeDetailListModel = CollegeDetailListModel.fromJson(response.data);
        institutions = CollegeDetailListModel.fromJson(response.data).message!;

        var request = await http.get(Uri.parse(
            "https://images.unsplash.com/photo-1549915293-94d35ecf4f0b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0MTk2ODd8MHwxfHNlYXJjaHwyfHxhbGFiYW1hfGVufDB8fHx8MTY4ODY4MjQ3MHww&ixlib=rb-4.0.3&q=80&w=1080"));
        databtybs = await request.bodyBytes;
        institutions.forEach((institution) {
          double latitude = institution.latitude ?? 34.54749 ;
          double longitude = institution.longitude ??  -112.45339;
          latLngList.add(LatLng(latitude, longitude));
          String namsttt = institution.city!;
          name.add(namsttt);
        });

        print("${latLngList.toString()}");
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
