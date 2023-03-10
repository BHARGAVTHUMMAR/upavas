import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:upvas/app/service/firebase_service.dart';

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
        DateFormat('dd-MM-yyyy').format(DateTime.now()).toString();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      data();
    });
    super.onInit();
  }

  data() async {
    hasData.value = false;
    getDataList.value = await FirebaseService().getUserData(
        date: selectedDate.value + "_" + dropdownValue.value.toString(),
        context: Get.context!);
    if (getDataList.length <= 0) {
      await FirebaseService().addUserDataToFireStore(
          date: selectedDate.value + "_" + dropdownValue.value.toString(),
          data: {"data": selectedList.map((e) => e.toJson()).toList()});
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
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2100));
    if (pickedDate != null) {
      print(pickedDate);
      selectedDate.value = DateFormat('dd-MM-yyyy').format(pickedDate);
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
