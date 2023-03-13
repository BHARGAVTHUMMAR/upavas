import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:upvas/app/constants/color_constant.dart';
import 'package:upvas/app/service/firebase_service.dart';

import '../../../../main.dart';
import '../../../constants/sizeConstant.dart';

class HomeController extends GetxController {
  RxString selectedDate = "".obs;
  RxList<SelectedModels> selectedList =
      List.generate(100, (index) => SelectedModels(isSelected: false.obs)).obs;
  RxList<SelectedModels> getDataList = RxList<SelectedModels>([]);
  RxList<String> list = <String>[
    'Savar',
    'Sanj',
  ].obs;
  RxString dropdownValue = "Savar".obs;
  RxBool hasData = false.obs;
  @override
  void onInit() {
    selectedDate.value =
        DateFormat('dd/MM/yyyy').format(DateTime.now()).toString();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      data();
    });
    super.onInit();
  }

  data() async {
    hasData.value = false;
    if (!isNullEmptyOrFalse(
        box.read(selectedDate.value + dropdownValue.value))) {
      getDataList.value =
          ((jsonDecode(box.read(selectedDate.value + dropdownValue.value))
                      as List<dynamic>)
                  .toList())
              .map((e) => SelectedModels.fromJson(e))
              .toList();
    }
    if (getDataList.length <= 0) {
      box.write(selectedDate.value + dropdownValue.value,
          jsonEncode(selectedList.map((e) => e.toJson()).toList()));
      selectedList.clear();
      selectedList.addAll(
          List.generate(100, (index) => SelectedModels(isSelected: false.obs)));
    } else {
      selectedList.clear();
      selectedList.addAll(getDataList);
    }
    hasData.value = true;
  }

  datePick({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: appTheme.SelectedColor, // <-- SEE HERE
                onPrimary: appTheme.primaryTheme, // <-- SEE HERE
                onSurface: Color.fromARGB(255, 66, 125, 145), // <-- SEE HERE
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: appTheme.textGrayColor, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      print(pickedDate);
      selectedDate.value = DateFormat('dd/MM/yyyy').format(pickedDate);
      data();
    } else {}
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

class SelectedModels {
  RxBool isSelected = false.obs;

  SelectedModels({
    required this.isSelected,
  });

  SelectedModels.fromJson(Map<String, dynamic> json) {
    isSelected.value = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSelected'] = this.isSelected.value;
    return data;
  }
}
