import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:upvas/app/constants/color_constant.dart';
import 'package:upvas/app/constants/sizeConstant.dart';

import '../controllers/upavaslist_controller.dart';

class UpavaslistView extends GetView<UpavaslistController> {
  const UpavaslistView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpavaslistController>(
        init: UpavaslistController(),
        builder: (context) {
          return Obx(() {
            return Scaffold(
                body: (controller.hasData.isFalse)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: appTheme.textGrayColor),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        controller.datePick(
                                            context: Get.context!);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(controller.selectedDate.value,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      appTheme.textGrayColor)),
                                          SizedBox(width: 10),
                                          Image.asset(
                                              "assets/icons_image/date.png",
                                              height: 20),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: appTheme.textGrayColor),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10.0, left: 10),
                                    child: DropdownButton<String>(
                                      value: controller.dropdownValue.value,
                                      elevation: 16,
                                      style: TextStyle(
                                          fontFamily: 'JosefinSans',
                                          color: appTheme.textGrayColor,
                                          fontWeight: FontWeight.w500),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      icon: Padding(
                                        padding: EdgeInsets.only(left: 20.0),
                                        child: Image.asset(
                                            "assets/icons_image/down.png",
                                            height: 20),
                                      ),
                                      underline: Container(
                                        // height: 2,
                                        color: Colors.white,
                                      ),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        controller.dropdownValue.value = value!;
                                        controller.data();
                                      },
                                      items: controller.list
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 8.0, left: 8, bottom: 8),
                                child: Row(
                                  children: [
                                    Text("Active",
                                        style: TextStyle(fontSize: 15)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    CircleAvatar(
                                        radius: 5,
                                        backgroundColor:
                                            appTheme.textGrayColor),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      controller.getDataList
                                          .where((element) {
                                            return element.isSelected.isTrue;
                                          })
                                          .toList()
                                          .length
                                          .toString(),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              child: (!isNullEmptyOrFalse(controller.tempList))
                                  ? GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 5,
                                              crossAxisSpacing: 5,
                                              mainAxisSpacing: 5),
                                      itemCount: controller.tempList.length,
                                      itemBuilder: (context, index) {
                                        return Obx(() {
                                          return Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      appTheme.unSelectedColor),
                                              child: Center(
                                                  child: Text(
                                                (controller.tempList[index] + 1)
                                                    .toString(),
                                                style: TextStyle(
                                                    color:
                                                        appTheme.textGrayColor,
                                                    fontSize: 20),
                                              )));
                                        });
                                      },
                                    )
                                  : Center(
                                      child: Text("No Data Found"),
                                    ),
                            ),
                          )
                        ],
                      ));
          });
        });
  }
}
