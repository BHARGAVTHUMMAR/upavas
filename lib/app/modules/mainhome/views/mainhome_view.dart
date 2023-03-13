import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:upvas/app/constants/color_constant.dart';
import 'package:upvas/app/modules/home/views/home_view.dart';
import 'package:upvas/app/modules/upavaslist/views/upavaslist_view.dart';

import '../controllers/mainhome_controller.dart';

class MainhomeView extends GetWidget<MainhomeController> {
  const MainhomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                TabBar(
                    indicatorColor: appTheme.primaryTheme,
                    onTap: (value) {
                      controller.SelectedTab.value = value;
                    },
                    // unselectedLabelColor: appTheme.textGrayColor,
                    tabs: [
                      Tab(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          (controller.SelectedTab.value == 0)
                              ? Image.asset(
                                  "assets/icons_image/home_select.png",
                                  height: 20)
                              : Image.asset(
                                  "assets/icons_image/home_unselect.png",
                                  height: 20),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Home",
                            style: TextStyle(
                                color: controller.SelectedTab.value == 0
                                    ? appTheme.primaryTheme
                                    : appTheme.textGrayColor),
                          ),
                        ],
                      )),
                      Tab(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          (controller.SelectedTab.value == 0)
                              ? Image.asset(
                                  "assets/icons_image/menu_unselect.png",
                                  height: 15)
                              : Image.asset(
                                  "assets/icons_image/menu_select.png",
                                  height: 15),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Upavas List",
                            style: TextStyle(
                                color: controller.SelectedTab.value == 0
                                    ? appTheme.textGrayColor
                                    : appTheme.primaryTheme),
                          ),
                        ],
                      )),
                    ]),
                Expanded(
                    child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [HomeView(), UpavaslistView()])),
              ],
            ),
          ),
        ),
      );
    });
  }
}
