
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';

class OnBoardFirst extends StatelessWidget {
const  OnBoardFirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomImageView(
            imagePath: ImageConstant.imgGroup29,
            height: 186.v,
            // width: 153.h,
            alignment: Alignment.center),
        SizedBox(height: 90.v),
        Align(
            alignment: Alignment.center,
            child: Text("lbl_find_a_college".tr,
                style: theme.textTheme.headlineLarge)),
        SizedBox(height: 17.v),
        SizedBox(
            width: 279.h,
            child: Text("msg_discover_your_personalized".tr,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.bodyLargeBlack90001
                    .copyWith(height: 1.11))),

      ],
    );
  }
}
