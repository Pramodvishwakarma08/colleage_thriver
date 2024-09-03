import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';
import 'widgets/peoplecardgrid_item_widget.dart';
import 'controller/mentors_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';

// ignore_for_file: must_be_immutable
class MentorsScreen extends GetWidget<MentorsController> {
  const MentorsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(title: "lbl_mentors".tr),
      body: Obx(
          ()=> controller.isLoading.value ? Center(child: CircularProgressIndicator(),) : Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
            //  15.v.heightBox,
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     CustomDropDown(
              //       width: 200.h,
              //       hintText: "lbl_web_development".tr,
              //       items:
              //           controller.mentorsModelObj.value.dropdownItemList.value,
              //       contentPadding: EdgeInsets.symmetric(
              //         horizontal: 5.h,
              //         vertical: 4.v,
              //       ),
              //       onChanged: (value) {
              //         controller.onSelected(value);
              //       },
              //     ),
              //     CustomDropDown(
              //       width: 120.h,
              //       hintText: "lbl_react".tr,
              //       items:
              //           controller.mentorsModelObj.value.dropdownItemList1.value,
              //       contentPadding: EdgeInsets.symmetric(
              //         horizontal: 6.h,
              //         vertical: 4.v,
              //       ),
              //       onChanged: (value) {
              //         controller.onSelected1(value);
              //       },
              //     ),
              //   ],
              // ),
            //  SizedBox(height: 20.v),
              _buildPeopleCardGridView(),
            ],
          ),
        ),
      ),
    );
  }

  /// GridView Widget
  Widget _buildPeopleCardGridView() {
    return  Expanded(
      child: controller.mentorModel.allMentors!.length == 0 ?Center(child: Padding(
        padding: const EdgeInsets.only(bottom: 100.0),
        child: Text("Mentors are not available"),
      ),) : GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 210.v,
            crossAxisCount: 3,
            mainAxisSpacing: 6.h,
            crossAxisSpacing: 6.h,
          ),
          physics: BouncingScrollPhysics(),
          itemCount:  controller.mentorModel.allMentors!.length,
          itemBuilder: (context, index) {
            return PeoplecardgridItemWidget(
              controller.mentorModel.allMentors![index],
            );
          },
        ),
    );
  }
}
