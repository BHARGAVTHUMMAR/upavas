import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../main.dart';
import '../../../constants/sizeConstant.dart';
import '../../home/controllers/home_controller.dart';

class AddUpvasController extends GetxController {
  RxString selectedDate = "".obs;
  RxBool isSavarSelected = true.obs;
  RxBool isSanjSelected = false.obs;
  RxBool isFullDaySelected = false.obs;
  RxBool hasData = false.obs;
  RxList<SelectedModels> getDataList = RxList<SelectedModels>([]);
  RxList<int> list = RxList<int>([]);
  RxString dropdownValue = "1".obs;
  RxString selectedDataDate = "".obs;

  @override
  void onInit() {
    selectedDate.value =
        DateFormat('dd MMM, yyyy').format(DateTime.now()).toString();
    selectedDataDate.value =
        DateFormat('dd/MM/yyyy').format(DateTime.now()).toString();
    data();
    super.onInit();
  }

  data({String text = "savar"}) async {
    hasData.value = false;
    list.clear();
    await Future.delayed(Duration(milliseconds: 50));

    if (getSelectedText() == "Full") {
      RxList<SelectedModels> getDataListSavar = RxList<SelectedModels>([]);
      RxList<SelectedModels> getDataListSanj = RxList<SelectedModels>([]);
      if (!isNullEmptyOrFalse(box.read(selectedDataDate.value + "Savar"))) {
        getDataListSavar.value =
            ((jsonDecode(box.read(selectedDataDate.value + "Savar"))
                        as List<dynamic>)
                    .toList())
                .map((e) => SelectedModels.fromJson(e))
                .toList();
      } else {
        box.write(
            selectedDataDate.value + "Savar",
            jsonEncode(List.generate(
                    100, (index) => SelectedModels(isSelected: false.obs))
                .map((e) => e.toJson())
                .toList()));
        getDataListSavar.value = List.generate(
            100, (index) => SelectedModels(isSelected: false.obs));
      }
      if (!isNullEmptyOrFalse(box.read(selectedDataDate.value + "Sanj"))) {
        getDataListSanj.value =
            ((jsonDecode(box.read(selectedDataDate.value + "Sanj"))
                        as List<dynamic>)
                    .toList())
                .map((e) => SelectedModels.fromJson(e))
                .toList();
      } else {
        box.write(
            selectedDataDate.value + "Sanj",
            jsonEncode(List.generate(
                    100, (index) => SelectedModels(isSelected: false.obs))
                .map((e) => e.toJson())
                .toList()));
        getDataListSanj.value = List.generate(
            100, (index) => SelectedModels(isSelected: false.obs));
      }
      for (int i = 0; i < getDataListSanj.length; i++) {
        if (getDataListSanj[i].isSelected.isFalse &&
            getDataListSavar[i].isSelected.isFalse) {
          list.add(i);
        }
      }
    } else {
      if (!isNullEmptyOrFalse(
          box.read(selectedDataDate.value + getSelectedText()))) {
        getDataList.value =
            ((jsonDecode(box.read(selectedDataDate.value + getSelectedText()))
                        as List<dynamic>)
                    .toList())
                .map((e) => SelectedModels.fromJson(e))
                .toList();

        if (!isNullEmptyOrFalse(getDataList)) {
          for (int i = 0; i < getDataList.length; i++) {
            if (getDataList[i].isSelected.isFalse) {
              list.add(i);
            }
          }
        }
      } else {
        box.write(
            selectedDataDate.value + getSelectedText(),
            jsonEncode(List.generate(
                    100, (index) => SelectedModels(isSelected: false.obs))
                .map((e) => e.toJson())
                .toList()));
        list.clear();

        list.addAll(List.generate(
          100,
          (index) {
            return index;
          },
        ));
      }
    }

    dropdownValue.value = list.first.toString();
    hasData.value = true;
  }

  datePick({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2100));
    if (pickedDate != null) {
      print(pickedDate);
      selectedDate.value = DateFormat('dd/MM/yyyy').format(pickedDate);
      selectedDataDate.value = DateFormat('dd/MM/yyyy').format(pickedDate);
      data();
    } else {}
  }

  getSelectedText() {
    if (isFullDaySelected.isTrue) {
      return "Full";
    } else if (isSavarSelected.isTrue) {
      return "Savar";
    } else if (isSanjSelected.isTrue) {
      return "Sanj";
    }
    return "Savar";
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
