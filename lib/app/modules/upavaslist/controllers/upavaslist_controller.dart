import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:upvas/app/constants/sizeConstant.dart';

import '../../../../main.dart';
import '../../../constants/color_constant.dart';
import '../../../service/firebase_service.dart';
import '../../home/controllers/home_controller.dart';

class UpavaslistController extends GetxController {
  RxString selectedDate = "".obs;
  RxList<String> list = <String>[
    'Savar',
    'Sanj',
  ].obs;
  RxString dropdownValue = "Savar".obs;
  RxList<SelectedModels> getDataList = RxList<SelectedModels>([]);
  RxList tempList = RxList([]);
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
    hasData.value = true;
    tempList.clear();
    if (!isNullEmptyOrFalse(getDataList)) {
      for (int i = 0; i < getDataList.length; i++) {
        if (getDataList[i].isSelected.isTrue) {
          tempList.add(i);
        }
      }
    }
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
