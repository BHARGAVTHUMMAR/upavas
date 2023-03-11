import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/color_constant.dart';
import '../controllers/add_upvas_controller.dart';

class AddUpvasView extends GetView<AddUpvasController> {
  const AddUpvasView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffF3F3F3),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/icons_image/back.png",
                  ),
                ),
              ),
            )),
        title: const Text('Add Upvas', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Obx(() {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Number", style: TextStyle(fontSize: 17)),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          height: 50,
                          width: 130,
                          decoration: BoxDecoration(
                              border: Border.all(color: appTheme.textGrayColor),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 10.0, left: 10),
                            child: DropdownButton<String>(
                              value: controller.dropdownValue.value.toString(),
                              elevation: 16,
                              style: TextStyle(
                                  fontFamily: 'JosefinSans',
                                  color: appTheme.textGrayColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              icon: Padding(
                                padding: EdgeInsets.only(left: 60.0, right: 0),
                                child: Image.asset(
                                    "assets/icons_image/down.png",
                                    height: 25),
                              ),
                              underline: Container(
                                // height: 2,
                                color: Colors.white,
                              ),
                              onChanged: (String? value) {
                                controller.dropdownValue.value = value!;
                              },
                              items: controller.list
                                  .map<DropdownMenuItem<String>>((value) {
                                return DropdownMenuItem<String>(
                                  value: value.toString(),
                                  child: Text(value.toString()),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Date", style: TextStyle(fontSize: 17)),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          height: 50,
                          width: 140,
                          decoration: BoxDecoration(
                              border: Border.all(color: appTheme.textGrayColor),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                controller.datePick(context: Get.context!);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(controller.selectedDate.value,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: appTheme.textGrayColor)),
                                  SizedBox(width: 10),
                                  Image.asset("assets/icons_image/date.png",
                                      height: 20),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ]),
            Positioned(
                child: Image.asset(
              "assets/icons_image/background.png",
              color: Colors.black,
            )),
          ],
        );
      }),
    );
  }
}
