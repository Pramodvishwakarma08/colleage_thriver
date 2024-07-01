import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/data_sources/remote/apI_endpoint_urls.dart';
import '../../../data/data_sources/remote/api_client.dart';/// A controller class for the SendYourDepositPage.
///
/// This class manages the state of the SendYourDepositPage, including the
/// current sendYourDepositModelObj
class SendYourDepositController extends GetxController {



 RxBool isLoading =false.obs;
 Rx<String>  profiePic  = "assets/images/image_not_found.png".obs;


 final ImagePicker _picker = ImagePicker();

 Future<void> imagePicker({required ImageSource source}) async {
  final XFile? pickedFile = await _picker.pickImage(source: source);
  CroppedFile ? croppedFile = await ImageCropper().cropImage(
   sourcePath: pickedFile!.path,
   aspectRatioPresets: [
    CropAspectRatioPreset.square,
   ],
   maxWidth: 600,
   maxHeight: 600,
  );
  if (croppedFile != null) {
   profiePic.value = croppedFile.path;
   print("object${croppedFile.path}");
   print("object${profiePic.value}");
   updateProfileImage(croppedFile);
  }
 }

 void showPicker(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
       return SafeArea(
        child: Container(
         color: Colors.white,
         child: Wrap(
          children: <Widget>[
           ListTile(
               leading: const Icon(Icons.photo_library),
               title: const Text('Gallery '),
               onTap: () {
                imagePicker(source: ImageSource.gallery);
                Navigator.of(context).pop();
               }),
           ListTile(
            leading: const Icon(Icons.video_camera_back_rounded),
            title: const Text('Camera'),
            onTap: () {
             imagePicker(source: ImageSource.camera);
             Navigator.of(context).pop();
            },
           ),
          ],
         ),
        ),
       );
      });
 }




 Future<void> updateProfileImage(CroppedFile file) async {

  var formData = FormData.fromMap({'commitmentLetter': [await MultipartFile.fromFile(file.path, ),],});
  final response = await  ApiClient().postRequest(endPoint:AppUrls.college_5_of_05 , body: formData);

  if (response.statusCode == 200) {
   print(json.encode(response.data));
   Get.back();
  } else {
   print("response==statusCode>${response.statusCode}");
  }
  Fluttertoast.showToast(msg: "${response.data["message"]}");
 }


 }
