// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
//
// import '../../widgets/custom_elevated_button.dart';
// import '../../widgets/custom_text_form_field.dart';
//
// _bottomSheetWidget(BuildContext context){
//   showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (context) {
//         return Obx(
//               () => FractionallySizedBox(
//               heightFactor: controller.hight.value,
//               child: GestureDetector(
//                 onTap: () {
//                   Get.back();
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: SingleChildScrollView(
//                     controller: _scrollController,
//                     physics: BouncingScrollPhysics(),
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(height: 15.v),
//                           Center(
//                             child: Text(
//                               "Help",
//                               style: TextStyle(
//                                 fontSize: 20.adaptSize,
//                                 fontWeight: FontWeight.w700,
//                                 color: appTheme.primary,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 24.v),
//                           Padding(
//                               padding: EdgeInsets.only(left: 11.h),
//                               child: Text("lbl_email".tr,
//                                   style: theme.textTheme.bodyMedium)),
//                           SizedBox(
//                             height: 10.v,
//                           ),
//                           CustomTextFormField(
//                               onTap: () {
//                                 controller.hight.value = 0.70;
//                               },
//                               onEditingComplete: () {
//                                 controller.hight.value = 0.45;
//                                 FocusScope.of(Get.context!).unfocus();
//                                 _scrollController.animateTo(
//                                   0.0,
//                                   duration: Duration(
//                                       milliseconds:
//                                       200), // Adjust the duration as needed
//                                   curve: Curves.easeInOut,
//                                 );
//                               },
//                               hintText: "please enter your email",
//                               controller: controller.emailExampleController,
//                               textInputAction: TextInputAction.done),
//                           SizedBox(
//                             height: 10.v,
//                           ),
//                           Padding(
//                               padding: EdgeInsets.only(left: 11.h),
//                               child: Text("Write your query".tr,
//                                   style: theme.textTheme.bodyMedium)),
//                           SizedBox(
//                             height: 10.v,
//                           ),
//                           CustomTextFormField(
//                               onTap: () {
//                                 controller.hight.value = 0.70;
//                               },
//                               onEditingComplete: () {
//                                 controller.hight.value = 0.45;
//                                 FocusScope.of(Get.context!).unfocus();
//                                 _scrollController.animateTo(
//                                   0.0,
//                                   duration: Duration(
//                                       milliseconds:
//                                       200), // Adjust the duration as needed
//                                   curve: Curves.easeInOut,
//                                 );
//                               },
//                               controller: controller.textEditingController,
//                               maxLines: 3,
//                               hintText: "Here is what I need an help",
//                               textInputAction: TextInputAction.done),
//                           SizedBox(
//                             height: 24.v,
//                           ),
//                           Obx(
//                                 () => CustomElevatedButton(
//                               isLoading: controller.isLoading.value,
//                               text: "Submit".tr,
//                               onPressed: () {
//                                 Get.back();
//                               },
//                             ),
//                           ),
//                           SizedBox(
//                             height: 400.v,
//                           ),
//                         ]),
//                   ),
//                 ),
//               )),
//         );
//       });
// }