import 'package:colleage_thriver/core/app_export.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/progress_dialog_utils.dart';
import '../../../../data/data_sources/remote/apI_endpoint_urls.dart';
import '../../../../data/data_sources/remote/api_client.dart';
import '../models/get_your_college_matches_model.dart';


class GetYourCollegeMatchesController extends GetxController{


  TextEditingController addressController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController stateNameController = TextEditingController();

  TextEditingController zipcodeController = TextEditingController();



  String ?  areYourFirstGenerationCollegeStudentValue ;
  List<DropdownMenuItem<String>> areYourFirstGenerationCollegeStudentList = [
    const DropdownMenuItem(
      value: 'In State',
      child: Text('In State'),
    ), const DropdownMenuItem(
      value: 'New York',
      child: Text('New York'),
    ),
    const DropdownMenuItem(
      value: 'Los Angeles',
      child: Text('Los Angeles'),
    ),
    const DropdownMenuItem(
      value: 'Chicago',
      child: Text('Chicago'),
    ),
    const DropdownMenuItem(
      value: 'Houston',
      child: Text('Houston'),
    ),
    const DropdownMenuItem(
      value: 'Phoenix',
      child: Text('Phoenix'),
    ),
    const DropdownMenuItem(
      value: 'Philadelphia',
      child: Text('Philadelphia'),
    ),
    const DropdownMenuItem(
      value: 'San Antonio',
      child: Text('San Antonio'),
    ),
  ];


  List<String> dropdownYearList = [
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
    '2029',
    '2030',
    '2031',


  ];
  String ? whenStartClg;



  @override
  void onInit() {
    super.onInit();
    getYourCollegeMatches();
  }

  @override
  void onClose() {
    super.onClose();
    addressController.dispose();
    cityController.dispose();
    stateNameController.dispose();
    zipcodeController.dispose();
  }




  RxBool isLoadingUpdateCollegeMatchOne =false.obs;
  Future<void> updateCollegeMatchOne() async{
    isLoadingUpdateCollegeMatchOne(true);

    var data = {
      'firstGen': '$areYourFirstGenerationCollegeStudentValue',
      'address': '${addressController.text}',
      'city': '${cityController.text}',
      'state': '${stateNameController.text}',
      'zip': '${zipcodeController.text}',
    };

    if(whenStartClg !=null){
      data['year'] = whenStartClg!;
    }


    try {
      var response = await ApiClient().postRequest(endPoint: AppUrls.collegeMatchOne,body: data);
      isLoadingUpdateCollegeMatchOne(false);

      if (response.statusCode == 200) {
        isLoadingUpdateCollegeMatchOne(false);
        Get.toNamed(AppRoutes.getYourCollegeMatchesThreeScreen,);
       // AppDialogUtils.showToast(message: '${response.data["message"]}');
      }else{
        isLoadingUpdateCollegeMatchOne.value = false;

      }
    } catch (e) {
      isLoadingUpdateCollegeMatchOne.value = false;
      AppDialogUtils.showToast(message: '${e.toString()}');
      print("catch(e)==>${e.toString()}");
    }
  }

  GetyourCollegeMatchesModel ? getYourCollegeMatchesModel;
  RxBool isLoadingCollegeGetMatchOne =false.obs;
  Future<void> getYourCollegeMatches() async{
    isLoadingCollegeGetMatchOne.value =true;
    try {
      var response = await ApiClient().getRequest(endPoint: AppUrls.getCollegeMatchAll,);
      isLoadingCollegeGetMatchOne.value =false;
      if (response.statusCode == 200) {
        if(GetyourCollegeMatchesModel.fromJson(response.data).allPoints![0].year !=null){
          whenStartClg= GetyourCollegeMatchesModel.fromJson(response.data).allPoints![0].year.toString();
        }
        addressController.text= GetyourCollegeMatchesModel.fromJson(response.data).allPoints![0].address ?? "";
        cityController.text= GetyourCollegeMatchesModel.fromJson(response.data).allPoints![0].city ?? "";
        stateNameController.text = GetyourCollegeMatchesModel.fromJson(response.data).allPoints![0].state ?? "";
        int ? zipcode = GetyourCollegeMatchesModel.fromJson(response.data).allPoints![0].zipCode;
        if(zipcode !=null){zipcodeController.text = GetyourCollegeMatchesModel.fromJson(response.data).allPoints![0].zipCode.toString();}
        isLoadingCollegeGetMatchOne(true);
        areYourFirstGenerationCollegeStudentValue = GetyourCollegeMatchesModel.fromJson(response.data).allPoints![0].firstGen ?? "In State";
        isLoadingCollegeGetMatchOne(false);
      } else {
        isLoadingCollegeGetMatchOne.value = false;
        AppDialogUtils.showToast(message: '${response.statusCode}');
      }
    } catch (e,line) {
      // isLoadingCollegeGetMatchOne.value = false;
      AppDialogUtils.showToast(message: '${e.toString()}');
      print("catch(e)==>${e.toString()}");
      print("catch(e)==>$line");
    }
  }






}
