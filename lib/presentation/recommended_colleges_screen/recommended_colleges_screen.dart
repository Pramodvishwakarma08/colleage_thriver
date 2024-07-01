import 'package:colleage_thriver/presentation/recommended_colleges_screen/recommended_colleges_singleview_screen.dart';
import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';
import '../map_screen/map_screen.dart';
import '../search/models/CollegeDetailListModel.dart';
import 'controller/recommended_colleges_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';

// ignore_for_file: must_be_immutable
class RecommendedCollegesScreen
    extends GetWidget<RecommendedCollegesOneController> {
  RecommendedCollegesScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(title: "msg_recommended_colleges".tr),
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
            : Padding(
                padding: EdgeInsets.only(left: 20.0.h, right: 20.h),
                child: ListView(
                  children: [
                    SizedBox(height: 15.v),
                    Text(
                      "msg_based_on_the_answers".tr,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles
                          .titleMediumSecondaryContainerMedium
                          .copyWith(
                        height: 1.00,
                      ),
                    ),
                    SizedBox(height: 15.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "msg_want_to_update_your".tr,
                          style: CustomTextStyles
                              .titleMediumSecondaryContainerMedium,
                        ),
                        CustomImageView(
                          imagePath: "assets/images/locationIcon.png",
                          height: 60.v,
                          onTap: () {
                            Get.to(() => MapScreen(
                                  locations: controller.latLngList,
                                  institutions: controller.institutions,
                                  dataBytes: controller.databtybs,
                                )
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 41.v),
                    controller.collegeDetailListModel.message!.length == 0 ? Container(
                      height: 400.v,
                      child: Center(child: Text("No Recommended colleges found"),),)
                    : _gridViewCards(),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _gridViewCards() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
          left: 13.h,
          right: 23.h,
        ),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 242.v,
            crossAxisCount: 2,
            mainAxisSpacing: 16.h,
            crossAxisSpacing: 16.h,
          ),
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.collegeDetailListModel.message!.length,
          itemBuilder: (context, index) {
            return card(
                seletedClg: controller.collegeDetailListModel.message![index]);
          },
        ),
      ),
    );
  }

  Widget card({required Message seletedClg}) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          Get.to(() =>
              RecommendedCollegesSingleViewScreen(seletedClg: seletedClg));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              radius: BorderRadius.circular(
                25.h,
              ),
              border: Border.all(color: Colors.grey),
              imagePath: seletedClg.photo,
              height: 147.v,
              width: 169.h,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 24.v),
            SizedBox(
              width: 154.h,
              child: Text(
                seletedClg.instnm.toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.labelLargeBlack90001.copyWith(
                  height: 1.2,
                ),
              ),
            ),
            SizedBox(height: 2.v),
            Text(
              seletedClg.city.toString(),
              style: CustomTextStyles.titleSmallGray600,
            ),
          ],
        ),
      ),
    );
  }
}
