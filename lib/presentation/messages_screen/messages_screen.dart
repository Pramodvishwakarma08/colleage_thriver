import 'package:colleage_thriver/core/app_export.dart';
import 'package:colleage_thriver/services/date_time_services.dart';
import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';
import 'package:colleage_thriver/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

import 'controller/messages_controller.dart';
import 'models/all_message_model.dart';

class MessagesScreen extends GetWidget<MessagesController> {
  const MessagesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.chatRoomModel.value == null ||
          controller.allMessageModel.value == null) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      return Scaffold(
          appBar: myAppbar(
              title: controller.chatRoomModel.value?.mentorName ?? "",
              imgUrl: controller.chatRoomModel.value?.mentorProfile ?? null),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            child: Column(
              children: [
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      reverse: true,
                      itemCount:
                          (controller.allMessageModel.value?.messages ?? [])
                              .length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        try {
                          Message? previousMessageModel;
                          try {
                            previousMessageModel = controller
                                .allMessageModel.value!.messages![index + 1];
                          } catch (e) {}

                          var m = controller
                              .allMessageModel.value!.messages![index];
                          return Column(
                            children: [
                              Builder(builder: (context) {
                                try {
                                  return Container(
                                    child: (previousMessageModel != null)
                                        ? DateTimeServices.isSameDate(
                                                date1:
                                                    DateTime.parse(m.createdOn!)
                                                        .toLocal(),
                                                date2: DateTime.parse(
                                                        previousMessageModel
                                                            .createdOn!)
                                                    .toLocal())
                                            ? const SizedBox.shrink()
                                            : messageDateStickyHeader(m)
                                        : messageDateStickyHeader(m),
                                  );
                                } catch (e, s) {
                                  return SizedBox.shrink();
                                  Logger().e(e, stackTrace: s);
                                }
                              }),
                              otherMessageWidget(
                                  message: controller
                                      .allMessageModel.value!.messages![index]),
                            ],
                          );
                        } catch (e, s) {
                          Logger().e(e, stackTrace: s);
                        }
                        return SizedBox.shrink();
                      },
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.h),
                  decoration: ShapeDecoration(
                    color: Color(0xFFEDEDED),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(39),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x1E000000),
                        blurRadius: 5,
                        offset: Offset(0, 0),
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: TextField(
                    textAlign: TextAlign.left,
                   keyboardType: TextInputType.text,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[ -~]')),
                    ],                   // textInputAction: TextInputAction.,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        // isDense: true,
                        suffixIcon: InkWell(
                          onTap: () {
                            if (controller
                                .messageTextEditingController.text.isNotEmpty) {
                              controller.onTapSendMessage();
                            } else {
                              print("object");
                            }
                          },
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 6.v),
                              child: Image.asset(
                                "assets/images/btnSend.png",
                                width: 46.v,
                                height: 46.v,
                              )),
                        ),
                        hintStyle: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 16.fSize,
                          fontWeight: FontWeight.w500,
                        ),
                        border: InputBorder.none,
                        hintText: "lbl_type_message".tr),
                    controller: controller.messageTextEditingController,
                    onSubmitted: (value) {
                      controller.onTapSendMessage();
                    },
                  ),
                ),
                SizedBox(
                  height: 30.v,
                )
                // Container(
                //   width: 358,
                //   height: 58,
                //   padding: const EdgeInsets.only(top: 6, left: 14, right: 6, bottom: 6),
                //   clipBehavior: Clip.antiAlias,
                //   decoration: ShapeDecoration(
                //     color: Color(0xFFEDEDED),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(39),
                //     ),
                //     shadows: [
                //       BoxShadow(
                //         color: Color(0x1E000000),
                //         blurRadius: 5,
                //         offset: Offset(0, 0),
                //         spreadRadius: 2,
                //       )
                //     ],
                //   ),
                //   child: Row(
                //     mainAxisSize: MainAxisSize.min,
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Opacity(
                //         opacity: 0.50,
                //         child: Text(
                //           'Type message...',
                //           style: TextStyle(
                //             color: Colors.black,
                //             fontSize: 16,
                //             fontFamily: 'Inter',
                //             fontWeight: FontWeight.w500,
                //             height: 0,
                //           ),
                //         ),
                //       ),
                //       Container(
                //         child: Row(
                //           mainAxisSize: MainAxisSize.min,
                //           mainAxisAlignment: MainAxisAlignment.end,
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: [
                //             Opacity(
                //               opacity: 0.50,
                //               child: Container(
                //                 width: 26,
                //                 height: 23.40,
                //                 child: Stack(),
                //               ),
                //             ),
                //             const SizedBox(width: 16),
                //             Container(
                //               width: 46,
                //               height: 46,
                //               child: Stack(
                //                 children: [
                //                   Positioned(
                //                     left: 0,
                //                     top: 0,
                //                     child: Container(
                //                       width: 46,
                //                       height: 46,
                //                       decoration: ShapeDecoration(
                //                         color: Color(0xFF7A62A3),
                //                         shape: RoundedRectangleBorder(
                //                           borderRadius: BorderRadius.circular(63),
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
          ));
    });
  }

  // ignore: unused_element
  /// Section Widget
  Widget _buildINeedHelpWritingMyCollege() {
    return CustomElevatedButton(
        height: 50.v,
        text: "msg_i_need_help_writing".tr,
        margin: EdgeInsets.only(left: 95.h),
        buttonStyle: CustomButtonStyles.fillPrimaryTL10,
        buttonTextStyle: CustomTextStyles.bodyMediumRobotoWhiteA700);
  }

  // ignore: unused_element
  /// Section Widget
  Widget _buildYesterday() {
    return CustomElevatedButton(
        height: 25.v,
        width: 69.h,
        text: "lbl_yesterday".tr,
        buttonStyle: CustomButtonStyles.fillBlueGray,
        buttonTextStyle: theme.textTheme.labelMedium!,
        alignment: Alignment.topCenter);
  }

  /// Section Widget
  Widget otherMessageWidget({required Message message}) {
    bool isSelfMessage = message.isMentor == 0;
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 0.v),
        decoration: AppDecoration.fillWhiteA700,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: isSelfMessage
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18.v),
              Container(
                  margin: EdgeInsets.only(
                      right: isSelfMessage ? 0 : 102.h,
                      left: isSelfMessage ? 102.h : 0.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.v),
                  decoration: AppDecoration.fillGray.copyWith(
                      color: isSelfMessage ? Color(0xFF7A62A3) : null,
                      borderRadius: BorderRadius.only(
                        topRight: isSelfMessage
                            ? Radius.circular(0)
                            : Radius.circular(10.h),
                        topLeft: Radius.circular(10.h),
                        bottomRight: Radius.circular(10.h),
                        bottomLeft: isSelfMessage
                            ? Radius.circular(10.h)
                            : Radius.circular(0),
                      )),
                  child: Text(
                    message.content ?? "",
                    style: GoogleFonts.roboto(
                      color: isSelfMessage ? Colors.white : Colors.black,
                      fontSize: 15.fSize,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
              SizedBox(height: 3.v),
              Builder(builder: (context) {
                try {
                  return Opacity(
                      opacity: 0.5,
                      child: Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Text(
                              DateTimeServices.convertUtcToLocalDateTime(
                                      DateTimeServices
                                              .convertMillisecondsToLocalizedDateTime(
                                                  DateTime.parse(
                                                          message.createdOn ??
                                                              "")
                                                      .millisecondsSinceEpoch)
                                          .dateTime!
                                          .toIso8601String())
                                  .time
                                  .toString(),
                              style: theme.textTheme.bodySmall)));
                } catch (e, s) {
                  Logger().e(e, stackTrace: s);
                }
                return SizedBox.shrink();
              })
            ]));
  }

  /// Section Widget

  /// Section Widget
  Widget _buildToday() {
    return CustomElevatedButton(
        height: 25.v,
        width: 50.h,
        text: "lbl_today".tr,
        buttonStyle: CustomButtonStyles.fillBlueGray,
        buttonTextStyle: theme.textTheme.labelMedium!,
        alignment: Alignment.topCenter);
  }

  /// Section Widget
  Widget selfMessageWidget({required Message message}) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.v),
        decoration: AppDecoration.fillWhiteA700,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 18.v),
              CustomElevatedButton(
                  height: 50.v,
                  width: 170.h,
                  text: message.content ?? "",
                  buttonStyle: CustomButtonStyles.fillPrimaryTL10,
                  buttonTextStyle: CustomTextStyles.bodyMediumRobotoWhiteA700),
              SizedBox(height: 3.v),
              Opacity(
                  opacity: 0.5,
                  child: Padding(
                      padding: EdgeInsets.only(right: 11.h),
                      child: Text(
                          DateTimeServices.convertUtcToLocalDateTime(
                                  DateTimeServices
                                          .convertMillisecondsToLocalizedDateTime(
                                              DateTime.parse(
                                                      message.createdOn ?? "")
                                                  .millisecondsSinceEpoch)
                                      .dateTime!
                                      .toIso8601String())
                              .time
                              .toString(),
                          style: theme.textTheme.bodySmall)))
            ]));
  }

  // ignore: unused_element,

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}

Container messageDateStickyHeader(Message messageModel) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 6.v),
    clipBehavior: Clip.antiAlias,
    decoration: ShapeDecoration(
      color: Color(0xFFF1F1F1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Opacity(
          opacity: 0.50,
          child: Text(
            DateTimeServices.getRelativeDayNameWithinPast7Days(
                    DateTime.parse(messageModel.createdOn ?? "")) ??
                DateTimeServices.convertMillisecondsToLocalizedDateTime(
                        DateTime.parse(messageModel.createdOn ?? "")
                            .millisecondsSinceEpoch)
                    .date!,
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontSize: 11.fSize,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    ),
  );
  return Container(
    margin: EdgeInsets.only(bottom: 15.h),
    child: Text(
      DateTimeServices.getRelativeDayNameWithinPast7Days(
              DateTime.parse(messageModel.createdOn ?? "")) ??
          DateTimeServices.convertMillisecondsToLocalizedDateTime(
                  DateTime.parse(messageModel.createdOn ?? "")
                      .millisecondsSinceEpoch)
              .date!,
      // style: kFontRobotoS12w500Gray(),
    ),
  );
}
