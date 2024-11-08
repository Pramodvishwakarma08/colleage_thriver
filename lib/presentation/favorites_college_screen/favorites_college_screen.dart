import 'package:colleage_thriver/widgets/app_bar/appbar_home_page.dart';

import '../recommended_colleges_screen/recommended_colleges_singleview_screen.dart';
import 'controller/favorites_college_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:colleage_thriver/core/app_export.dart';

class FavoritesCollegeScreen extends StatefulWidget {
  @override
  State<FavoritesCollegeScreen> createState() => _FavoritesCollegeScreenState();
}

class _FavoritesCollegeScreenState extends State<FavoritesCollegeScreen> {
  FavoritesCollegeController controller =
      Get.find<FavoritesCollegeController>();
  bool favraite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(title: "College Favorites"),
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
            : controller.favrateCollegeList.message!.length == 0
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FloatingActionButton(onPressed: () {
                          Get.toNamed(AppRoutes.topStudentsOneScreen);
                          
                        },
                          child: Icon(Icons.add,color: Colors.white,),
                        ),
                        SizedBox(height: 20,),
                        Text("Add college to favorite"),
                      ],
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
                      itemCount: controller.favrateCollegeList.message!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(() => RecommendedCollegesSingleViewScreen(
                                  seletedClg: controller
                                      .favrateCollegeList.message![index],
                                ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomImageView(
                                border: Border.all(color: Colors.grey.shade400),
                                imagePath:
                                    "${controller.favrateCollegeList.message![index].photo}",
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
                                      child: Text(
                                        "${controller.favrateCollegeList.message![index].instnm}",
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
                                    Container(
                                      width: 200.h,
                                      child: Text(
                                        "${controller.favrateCollegeList.message![index].city}",
                                        style: theme.textTheme.labelLarge,
                                      ),
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
}
