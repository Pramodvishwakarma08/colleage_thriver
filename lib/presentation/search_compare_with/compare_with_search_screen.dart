import '../comparison_screen/comparison_screen/comparison_screen.dart';
import '../search/controller/top_students_one_controller.dart';
import '../search/models/CollegeDetailListModel.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';

// ignore: must_be_immutable
class CompareWithSearchScreen extends StatefulWidget {
  Message selectedClg;
  CompareWithSearchScreen({Key? key, required this.selectedClg})
      : super(
          key: key,
        );

  @override
  State<CompareWithSearchScreen> createState() =>
      _CompareWithSearchScreenState();
}

class _CompareWithSearchScreenState extends State<CompareWithSearchScreen> {
  TopStudentsOneController controller = Get.put(TopStudentsOneController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBa1(context),
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
            : Padding(
                padding: EdgeInsets.only(
                  left: 16.h,
                  top: 10.v,
                  right: 39.h,
                ),
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (
                    context,
                    index,
                  ) {
                    return SizedBox(
                      height: 32.v,
                    );
                  },
                  itemCount: controller.collegeDetailListModel.message!.length,
                  itemBuilder: (context, index) {
                    print("ASDFGFDSDFGFDFGFDFGFGFG${widget.selectedClg.id}");
                    // Universitycard1ItemModel model = controller.topStudentsOneModelObj.value.universitycard1ItemList.value[index];
                    return widget.selectedClg.id ==
                            controller.collegeDetailListModel.message![index].id
                        ? SizedBox()
                        : InkWell(
                            onTap: () {
                              Get.to(() => ComparisonScreen(
                                    firstClg: widget.selectedClg,
                                    secondClg: controller
                                        .collegeDetailListModel.message![index],
                                  ));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomImageView(
                                  imagePath:
                                      "${controller.collegeDetailListModel.message![index].photo}",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 194.h,
                                        child: Text(
                                          "${controller.collegeDetailListModel.message![index].instnm}",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: CustomTextStyles
                                              .titleSmallBlack90001
                                              .copyWith(
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
    return PreferredSize(
        preferredSize: Size(80, 200),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_outlined)),
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
                      controller.getCollegeDetailList(
                          controller.searchController.text);
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
