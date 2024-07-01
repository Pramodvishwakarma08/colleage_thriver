import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../controller/mentors_controller.dart';
import '../models/mentors_model.dart';

// ignore: must_be_immutable
class PeoplecardgridItemWidget extends StatelessWidget {
  PeoplecardgridItemWidget(
    this.peoplecardgridItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  AllMentor peoplecardgridItemModelObj;

  var controller = Get.find<MentorsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5.h,
        vertical: 4.v,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 7.v),
          CustomImageView(
            imagePath:
                peoplecardgridItemModelObj.profileImage ?? ImageConstant.avtar,
            height: 104.adaptSize,
            width: 104.adaptSize,
            fit: BoxFit.cover,
            radius: BorderRadius.circular(
              54.h,
            ),
          ),

          SizedBox(height: 5.v),
          Text(
            peoplecardgridItemModelObj.name.toString(),
            style: CustomTextStyles.labelLargeRobotoBlack90001_1,
          ),
          //
          Opacity(
            opacity: 0.5,
            child: Text(
              peoplecardgridItemModelObj.hghSclName ?? '',
              style: CustomTextStyles.labelLargeRobotoBlack90001SemiBold,
            ),
          ),
          SizedBox(height: 5.v),
          // Text(
          //     peoplecardgridItemModelObj.hghSclName ?? "",
          //     style: CustomTextStyles.labelLargeRobotoBlack90001,
          // ),
          SizedBox(height: 7.v),
          CustomElevatedButton(
            onPressed: () {
              onTapConnect(mentor: peoplecardgridItemModelObj);
            },
            height: 24.v,
            width: 98.h,
            text: "lbl_connect".tr,
            buttonStyle: CustomButtonStyles.fillPrimaryTL4,
            buttonTextStyle: CustomTextStyles.titleSmallMedium,
          ),
        ],
      ),
    );
  }

  onTapConnect({required AllMentor mentor}) {
    // Get.to(ChatRoomPage(participant: null, chatId: ,));//todo
    Get.toNamed(AppRoutes.messagesScreen,
        arguments: {"mentorId": mentor.id.toString()});
  }
}
