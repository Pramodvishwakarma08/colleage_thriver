import 'package:colleage_thriver/presentation/recommended_colleges_screen/recommended_colleges_singleview_screen.dart';
import 'controller/top_students_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';

// ignore_for_file: must_be_immutable
// class TopStudentsOneScreen extends GetWidget<TopStudentsOneController> {
//   const TopStudentsOneScreen({Key? key}) : super(key: key,);
//
//
//   TopStudentsOneController controller =Get.find<TopStudentsOneController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBa1(context),
//       body: Obx(
//         ()=> controller.isLoading.value ? Center(child: CircularProgressIndicator(strokeWidth: 2,),) : Padding(
//           padding: EdgeInsets.only(left: 16.h, top: 10.v, right: 39.h,),
//           child:  ListView.separated(
//               physics: BouncingScrollPhysics(),
//               shrinkWrap: true,
//               separatorBuilder: (context, index,
//               ) {
//                 return SizedBox(
//                   height: 32.v,
//                 );
//               },
//               itemCount: controller.collegeDetailListModel.message!.length,
//               itemBuilder: (context, index) {
//                 // Universitycard1ItemModel model = controller.topStudentsOneModelObj.value.universitycard1ItemList.value[index];
//                 return InkWell(
//                   onTap: (){
//                      Get.to(()=>RecommendedCollegesSingleViewScreen(cardmodel: controller.collegeDetailListModel.message![index],));
//                   },
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                      CustomImageView(
//                           imagePath: "${controller.collegeDetailListModel.message![index].photo}",
//                           height: 90.v,
//                           width: 119.h,
//                           fit: BoxFit.cover,
//                           radius: BorderRadius.circular(
//                             10.h,
//                           ),
//
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                           top: 5.v,
//                           bottom: 7.v,
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               width: 194.h,
//                               child:  Text(
//                                   "${controller.collegeDetailListModel.message![index].instnm}",
//                                   maxLines: 2,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: CustomTextStyles.titleSmallBlack90001.copyWith(
//                                     height: 1.60,
//                                   ),
//                                 ),
//                             ),
//                             SizedBox(height: 12.v),
//                             Text(
//                                     "${controller.collegeDetailListModel.message![index].city}",
//                                 style: theme.textTheme.labelLarge,
//
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//         ),
//       ),
//     );
//   }
//
//   /// Section Widget
//   PreferredSizeWidget _buildAppBar() {
//     return CustomAppBar(
//       height: 97.v,
//       leadingWidth: 32.h,
//       leading: InkWell(
//         onTap: (){
//           Get.back();
//         },
//         child: Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: Icon(Icons.arrow_back_outlined,color: Colors.black54,),
//         ),
//       ),
//       title: AppbarTitleSearchview(
//         margin: EdgeInsets.only(left: 11.h),
//         hintText: "Search college".tr,
//         controller: controller.searchController,
//       ),
//     );
//   }
//
//   PreferredSizeWidget _buildAppBa1(context) {
//     return PreferredSize(preferredSize: Size(80,200),
//       child: SafeArea(
//           child:  Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Container(
//               padding: EdgeInsets.only(left: 20.0),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   width: 1.0,
//                   color: Colors.grey
//                 ),
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: TextField(
//                 controller: controller.searchController,
//                 onChanged: (value) {
//                   controller.getCollegeDetailList(controller.searchController.text);
//
//                 },
//                 decoration: InputDecoration(
//                   hintText: 'Search...',
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//           ),
//       )
//     );
//   }
//
//
// }



class TopStudentsOneScreen extends StatefulWidget {

  @override
  State<TopStudentsOneScreen> createState() => _TopStudentsOneScreenState();
}

class _TopStudentsOneScreenState extends State<TopStudentsOneScreen> {

  TopStudentsOneController controller =Get.find<TopStudentsOneController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBa1(context),
      body: Obx(
            ()=> controller.isLoading.value ? Center(child: CircularProgressIndicator(strokeWidth: 2,),) : Padding(
          padding: EdgeInsets.only(left: 16.h, top: 10.v, right: 39.h,),
          child:  ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index,
                ) {
              return SizedBox(
                height: 32.v,
              );
            },
            itemCount: controller.collegeDetailListModel.message!.length,
            itemBuilder: (context, index) {
              // Universitycard1ItemModel model = controller.topStudentsOneModelObj.value.universitycard1ItemList.value[index];
              return InkWell(
                onTap: (){
                  Get.to(()=>RecommendedCollegesSingleViewScreen(seletedClg: controller.collegeDetailListModel.message![index],));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomImageView(
                      border: Border.all(color: Colors.grey),
                      imagePath: "${controller.collegeDetailListModel.message![index].photo}",
                      height: 90.v,
                      width: 119.h,
                      fit: BoxFit.cover,
                      radius: BorderRadius.circular(
                        10.h,
                      ),

                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5.v,
                        bottom: 7.v,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 194.h,
                            child:  Text(
                              "${controller.collegeDetailListModel.message![index].instnm}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.titleSmallBlack90001.copyWith(
                                height: 1.60,
                              ),
                            ),
                          ),
                          SizedBox(height: 12.v),
                          Text(
                            "${controller.collegeDetailListModel.message![index].city}",
                            style: theme.textTheme.labelLarge,

                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// Section Widget

  PreferredSizeWidget _buildAppBa1(context) {
    return PreferredSize(preferredSize: Size(80,200),
        child: SafeArea(
          child:  Padding(
            padding:  EdgeInsets.all(10.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {
                  Get.back();
                }, icon: Icon(Icons.arrow_back_outlined)),
                Container(
                  width: 318.h,
                  padding: EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextField(
                    controller: controller.searchController,
                    onChanged: (value) {
                      controller.getCollegeDetailList(controller.searchController.text);
                      setState(() {});
                    },
                    style: CustomTextStyles.titleMediumBlack90001SemiBold,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: InputBorder.none,

                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

}
