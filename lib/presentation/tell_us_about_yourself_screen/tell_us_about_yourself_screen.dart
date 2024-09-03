import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:colleage_thriver/core/utils/textfield_validation.dart';
import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';
import 'controller/tell_us_about_yourself_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/widgets/custom_elevated_button.dart';
import 'package:colleage_thriver/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class TellUsAboutYourselfScreen extends GetWidget<TellUsAboutYourselfController> {
  TellUsAboutYourselfScreen({Key? key}) : super(key: key);

  final ImagePicker _picker = ImagePicker();
  Future<void> _imagePicker({required ImageSource source}) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile!.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
    );
    if (croppedFile != null) {
      // setState(() {
      controller.profiePic.value = croppedFile.path;
      print("object${croppedFile.path}");
      print("object${controller.profiePic.value}");
      controller.updateProfileImage(croppedFile);
      // });
    }
  }

  void _showPicker(context) {
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
                        _imagePicker(source: ImageSource.gallery);
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: const Icon(Icons.video_camera_back_rounded),
                    title: const Text('Camera'),
                    onTap: () {
                      _imagePicker(source: ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppbar(title: 'msg_tell_us_about_yourself'.tr),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Obx(
              () => controller.isLoading.value
                  ? SizedBox(
                    height: 500,
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                  )
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20.v,),

                        Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                                height: 151.v,
                                width: 153.h,
                                child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      CustomImageView(
                                          imagePath:controller.profiePic.value,
                                          height: 150.adaptSize,
                                          width: 150.adaptSize,
                                          fit: BoxFit.cover,
                                          radius: BorderRadius.circular(75.h),
                                          alignment: Alignment.center),
                                      Align(
                                          alignment: Alignment.bottomRight,
                                          child: InkWell(
                                            onTap: () {
                                              _showPicker(context);
                                            },
                                            child: Container(
                                                height: 50.v,
                                                width: 50.v,
                                                padding: EdgeInsets.all(10.h),
                                                decoration: AppDecoration
                                                    .fillPrimary
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder20),
                                                child: CustomImageView(
                                                    imagePath:
                                                        ImageConstant.imgCamera,
                                                    height: 21.v,
                                                    width: 24.h,
                                                    color: Colors.white,
                                                    alignment: Alignment.center)),
                                          ))
                                    ]))),

                        //profile image  end

                        SizedBox(height: 16.v),
                        Center(
                          child: Text("msg_upload_profile_photo".tr,
                                  style: CustomTextStyles.bodyMediumRobotoIndigo900),
                        ),
                        SizedBox(height: 16.v),
                        Padding(
                            padding: EdgeInsets.only(left: 11.h),
                            child: Text("lbl_first_name".tr,
                                style: theme.textTheme.bodyMedium)),
                        SizedBox(height: 10.v),
                        CustomTextFormField(
                          hintText: "lbl_first_name".tr,
                          controller: controller.firstNameController,
                          validator: Validator.validateFirstName,
                        ),
                        SizedBox(height: 18.v),
                        Padding(
                            padding: EdgeInsets.only(left: 11.h),
                            child: Text("lbl_last_name".tr,
                                style: theme.textTheme.bodyMedium)),
                        SizedBox(height: 9.v),

                        CustomTextFormField(
                          hintText: "lbl_last_name".tr,
                          controller: controller.lastNameController,
                          validator: Validator.validateLastName,

                        ),

                        //email

                            SizedBox(height: 18.v),
                            Padding(
                                padding: EdgeInsets.only(left: 11.h),
                                child: Text("Email".tr,
                                    style: theme.textTheme.bodyMedium)),
                            SizedBox(height: 9.v),

                            CustomTextFormField(
                              disableUserInput: true,
                              hintText: "Email".tr,
                              controller: controller.emailController,
                            ),






                        SizedBox(height: 18.v),
                        Padding(
                            padding: EdgeInsets.only(left: 11.h),
                            child: Text("lbl_gender".tr,
                                style: theme.textTheme.bodyMedium)),
                        SizedBox(height: 9.v),
                        _genderWidget(),

                        SizedBox(height: 17.v),
                        Padding(
                            padding: EdgeInsets.only(left: 11.h),
                            child: Text("lbl_date_of_birth".tr,
                                style: theme.textTheme.bodyMedium)),
                        SizedBox(height: 10.v),
                        _ageSelector(),
                        //age end  end

                        SizedBox(height: 19.v),
                        Padding(
                            padding: EdgeInsets.only(left: 11.h),
                            child: Text("lbl_ethnicity".tr,
                                style: theme.textTheme.bodyMedium)),
                        SizedBox(height: 12.v),
                        _ethnicity(),
                        SizedBox(height: 30.v),
                        Obx(
                          () => CustomElevatedButton(
                              isLoading: controller.isLoadingUpdateProfile.value,
                              text: "lbl_continue".tr,
                              onPressed: () {
                                onTapContinue();
                              }),
                        ),
                        SizedBox(height: 30.v),

                      ]),
                    ),
            ),
          ),
        ));
  }

  /// age select Widget
  Widget _ageSelector() {
    return InkWell(
      onTap: () {
        datePicker();
      },
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 9.h, vertical: 10.v),
          decoration: AppDecoration.outlineGray
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
                padding: EdgeInsets.only(top: 2.v),
                child: Obx(() => Text(controller.date.value,
                    style: CustomTextStyles.titleSmallBlack90001Medium_1))),
            CustomImageView(
                imagePath: ImageConstant.imgCalendar,
                height: 21.adaptSize,
                color: theme.colorScheme.primary,
                width: 21.adaptSize)
          ])),
    );
  }

  // checkbox Widget

  Widget _ethnicity() {
    return Column(
      children: [
        Row(
          children: [
            Obx(
              () => Checkbox(
                value: controller.african_american.value,
                onChanged: (value) {
                  controller.african_american.value = value!;
                },
              ),
            ),
            SizedBox(width: 5.h,),
            Text(
              "msg_african_american".tr,
              textAlign: TextAlign.center,
              style: CustomTextStyles.titleMediumInterBlack90001SemiBold,
            ),
          ],
        ),
        Row(
          children: [
            Obx(
              () => Checkbox(
                value: controller.american_indian.value,
                onChanged: (value) {
                  controller.american_indian.value = value!;
                },
              ),
            ),
            SizedBox(width: 5.h,),

            Text(
              "msg_american_indian".tr,
              textAlign: TextAlign.center,
              style: CustomTextStyles.titleMediumInterBlack90001SemiBold,
            ),
          ],
        ),
        Row(
          children: [
            Obx(
              () => Checkbox(
                value: controller.asian_or_pacific.value,
                onChanged: (value) {
                  controller.asian_or_pacific.value = value!;
                },
              ),
            ),
            SizedBox(width: 5.h,),

            Text(
              "msg_asian_or_pacific".tr,
              textAlign: TextAlign.center,
              style: CustomTextStyles.titleMediumInterBlack90001SemiBold,
            ),
          ],
        ),
        Row(
          children: [
            Obx(
              () => Checkbox(
                value: controller.hispanic_latino.value,
                onChanged: (value) {
                  controller.hispanic_latino.value = value!;
                },
              ),
            ),
            SizedBox(width: 5.h,),

            Text(
              "lbl_hispanic_latino".tr,
              textAlign: TextAlign.center,
              style: CustomTextStyles.titleMediumInterBlack90001SemiBold,
            ),
          ],
        ),
        Row(
          children: [
            Obx(
              () => Checkbox(
                value: controller.white.value,
                onChanged: (value) {
                  controller.white.value = value!;
                },
              ),
            ),
            SizedBox(width: 5.h,),

            Text(
              "lbl_white".tr,
              textAlign: TextAlign.center,
              style: CustomTextStyles.titleMediumInterBlack90001SemiBold,
            ),
          ],
        ),
        Row(
          children: [
            Obx(
              () => Checkbox(
                value: controller.other.value,
                onChanged: (value) {
                  controller.other.value = value!;
                },
              ),
            ),
            SizedBox(width: 5.h,),
            Text(
              "lbl_other".tr,
              textAlign: TextAlign.center,
              style: CustomTextStyles.titleMediumInterBlack90001SemiBold,
            ),
          ],
        ),
      ],
    );
  }

  Rx<DateTime>  one = Rx(DateTime(DateTime.now().year - 13, DateTime.now().month, DateTime.now().day));

  Future<void> datePicker() async {
    DateTime? dateTime = await showDatePicker(
        context: Get.context!,
        initialDate: controller.selectedDate!.value,
        firstDate: DateTime(1970),
        lastDate: one.value 
    );
    if (dateTime != null) {
      controller.selectedDate!.value = dateTime;
      controller.date.value = dateTime.format(dateTimeFormatPattern);
    }
  }

  Widget _genderWidget() {
    return Obx(
      () => SizedBox(
        width: Get.width,
        height: 50.h,
        child: DropdownButtonFormField(
          value: controller.gender.value,
          items: controller.genderList.map((String item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (value) {
            controller.gender.value = value.toString();
          },
          icon: Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Icon(
              Icons.arrow_drop_down_rounded,
              color: Colors.grey,
            ),
          ),
          decoration: decoration,
          style: CustomTextStyles.titleSmallBlack90001Medium,
          hint: Text(
            "lbl_month".tr,
            style: CustomTextStyles.titleSmallBlack90001Medium,
          ),
        ),
      ),
    );
  }

  InputDecoration get decoration => InputDecoration(
        hintStyle: CustomTextStyles.titleSmallBlack90001Medium,
        isDense: true,
        contentPadding: EdgeInsets.only(
          left: 10.h,
          top: 10.v,
          bottom: 10.v,
        ),
        fillColor: appTheme.whiteA700,
        // filled: filled,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: appTheme.gray60002,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: appTheme.gray60002,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.h),
          borderSide: BorderSide(
            color: appTheme.gray60001,
            width: 1,
          ),
        ),
      );

  onTapContinue() {
    if (_formKey.currentState!.validate()){
      controller.updateProfile();

    }
    // controller.updateProfile();
  }
}
