import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddUpvasController extends GetxController {
  RxString selectedDate = "".obs;

  RxList list = List.generate(
    100,
    (index) {
      return index;
    },
  ).obs;
  RxString dropdownValue = "1".obs;
  @override
  void onInit() {
    selectedDate.value =
        DateFormat('dd MMM, yyyy').format(DateTime.now()).toString();
    super.onInit();
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
