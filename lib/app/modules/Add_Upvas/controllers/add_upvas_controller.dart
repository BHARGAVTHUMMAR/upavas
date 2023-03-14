import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../main.dart';
import '../../../constants/app_constant.dart';
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

    if (getSelectedText() == ArgumentConstant.full) {
      RxList<SelectedModels> getDataListSavar = RxList<SelectedModels>([]);
      RxList<SelectedModels> getDataListSanj = RxList<SelectedModels>([]);
      if (!isNullEmptyOrFalse(
          box.read(selectedDataDate.value + ArgumentConstant.savar))) {
        getDataListSavar.value = ((jsonDecode(box
                        .read(selectedDataDate.value + ArgumentConstant.savar))
                    as List<dynamic>)
                .toList())
            .map((e) => SelectedModels.fromJson(e))
            .toList();
      } else {
        box.write(
            selectedDataDate.value + ArgumentConstant.savar,
            jsonEncode(RxList<SelectedModels>([
              SelectedModels(Name: "1".obs, isSelected: false.obs),
              SelectedModels(Name: "2".obs, isSelected: false.obs),
              SelectedModels(Name: "3".obs, isSelected: false.obs),
              SelectedModels(Name: "4".obs, isSelected: false.obs),
              SelectedModels(Name: "5".obs, isSelected: false.obs),
              SelectedModels(Name: "6".obs, isSelected: false.obs),
              SelectedModels(Name: "7".obs, isSelected: false.obs),
              SelectedModels(Name: "8".obs, isSelected: false.obs),
              SelectedModels(Name: "9".obs, isSelected: false.obs),
              SelectedModels(Name: "10".obs, isSelected: false.obs),
              SelectedModels(Name: "11".obs, isSelected: false.obs),
              SelectedModels(Name: "12".obs, isSelected: false.obs),
              SelectedModels(Name: "13".obs, isSelected: false.obs),
              SelectedModels(Name: "14".obs, isSelected: false.obs),
              SelectedModels(Name: "15".obs, isSelected: false.obs),
              SelectedModels(Name: "16".obs, isSelected: false.obs),
              SelectedModels(Name: "17".obs, isSelected: false.obs),
              SelectedModels(Name: "18".obs, isSelected: false.obs),
              SelectedModels(Name: "19".obs, isSelected: false.obs),
              SelectedModels(Name: "20".obs, isSelected: false.obs),
              SelectedModels(Name: "21".obs, isSelected: false.obs),
              SelectedModels(Name: "22".obs, isSelected: false.obs),
              SelectedModels(Name: "23".obs, isSelected: false.obs),
              SelectedModels(Name: "24".obs, isSelected: false.obs),
              SelectedModels(Name: "25".obs, isSelected: false.obs),
              SelectedModels(Name: "26".obs, isSelected: false.obs),
              SelectedModels(Name: "27".obs, isSelected: false.obs),
              SelectedModels(Name: "28".obs, isSelected: false.obs),
              SelectedModels(Name: "29".obs, isSelected: false.obs),
              SelectedModels(Name: "30".obs, isSelected: false.obs),
              SelectedModels(Name: "31".obs, isSelected: false.obs),
              SelectedModels(Name: "32".obs, isSelected: false.obs),
              SelectedModels(Name: "33".obs, isSelected: false.obs),
              SelectedModels(Name: "34".obs, isSelected: false.obs),
              SelectedModels(Name: "35".obs, isSelected: false.obs),
              SelectedModels(Name: "36".obs, isSelected: false.obs),
              SelectedModels(Name: "37".obs, isSelected: false.obs),
              SelectedModels(Name: "38".obs, isSelected: false.obs),
              SelectedModels(Name: "39".obs, isSelected: false.obs),
              SelectedModels(Name: "40".obs, isSelected: false.obs),
              SelectedModels(Name: "41".obs, isSelected: false.obs),
              SelectedModels(Name: "42".obs, isSelected: false.obs),
              SelectedModels(Name: "43".obs, isSelected: false.obs),
              SelectedModels(Name: "44".obs, isSelected: false.obs),
              SelectedModels(Name: "45".obs, isSelected: false.obs),
              SelectedModels(Name: "46".obs, isSelected: false.obs),
              SelectedModels(Name: "47".obs, isSelected: false.obs),
              SelectedModels(Name: "48".obs, isSelected: false.obs),
              SelectedModels(Name: "49".obs, isSelected: false.obs),
              SelectedModels(Name: "50".obs, isSelected: false.obs),
              SelectedModels(Name: "51".obs, isSelected: false.obs),
              SelectedModels(Name: "52".obs, isSelected: false.obs),
              SelectedModels(Name: "53".obs, isSelected: false.obs),
              SelectedModels(Name: "54".obs, isSelected: false.obs),
              SelectedModels(Name: "55".obs, isSelected: false.obs),
              SelectedModels(Name: "56".obs, isSelected: false.obs),
              SelectedModels(Name: "57".obs, isSelected: false.obs),
              SelectedModels(Name: "58".obs, isSelected: false.obs),
              SelectedModels(Name: "59".obs, isSelected: false.obs),
              SelectedModels(Name: "60".obs, isSelected: false.obs),
              SelectedModels(Name: "61".obs, isSelected: false.obs),
              SelectedModels(Name: "62".obs, isSelected: false.obs),
              SelectedModels(Name: "63".obs, isSelected: false.obs),
              SelectedModels(Name: "64".obs, isSelected: false.obs),
              SelectedModels(Name: "65".obs, isSelected: false.obs),
              SelectedModels(Name: "P1".obs, isSelected: false.obs),
              SelectedModels(Name: "P2".obs, isSelected: false.obs),
              SelectedModels(Name: "P3".obs, isSelected: false.obs),
              SelectedModels(Name: "P4".obs, isSelected: false.obs),
              SelectedModels(Name: "P5".obs, isSelected: false.obs),
              SelectedModels(Name: "P6".obs, isSelected: false.obs),
              SelectedModels(Name: "P7".obs, isSelected: false.obs),
              SelectedModels(Name: "P8".obs, isSelected: false.obs),
              SelectedModels(Name: "P9".obs, isSelected: false.obs),
              SelectedModels(Name: "P10".obs, isSelected: false.obs),
              SelectedModels(Name: "S1".obs, isSelected: false.obs),
              SelectedModels(Name: "S2".obs, isSelected: false.obs),
              SelectedModels(Name: "S3".obs, isSelected: false.obs),
              SelectedModels(Name: "S4".obs, isSelected: false.obs),
              SelectedModels(Name: "S5".obs, isSelected: false.obs),
              SelectedModels(Name: "S6".obs, isSelected: false.obs),
              SelectedModels(Name: "S7".obs, isSelected: false.obs),
              SelectedModels(Name: "S8".obs, isSelected: false.obs),
              SelectedModels(Name: "S9".obs, isSelected: false.obs),
              SelectedModels(Name: "S10".obs, isSelected: false.obs),
              SelectedModels(Name: "S11".obs, isSelected: false.obs),
              SelectedModels(Name: "S12".obs, isSelected: false.obs),
              SelectedModels(Name: "S13".obs, isSelected: false.obs),
              SelectedModels(Name: "S14".obs, isSelected: false.obs),
              SelectedModels(Name: "S15".obs, isSelected: false.obs),
              SelectedModels(Name: "S16".obs, isSelected: false.obs),
              SelectedModels(Name: "S17".obs, isSelected: false.obs),
              SelectedModels(Name: "M18".obs, isSelected: false.obs),
              SelectedModels(Name: "M19".obs, isSelected: false.obs),
              SelectedModels(Name: "M20".obs, isSelected: false.obs),
              SelectedModels(Name: "M21".obs, isSelected: false.obs),
              SelectedModels(Name: "M22".obs, isSelected: false.obs),
              SelectedModels(Name: "SE1".obs, isSelected: false.obs),
              SelectedModels(Name: "SE2".obs, isSelected: false.obs),
              SelectedModels(Name: "SE3".obs, isSelected: false.obs),
              SelectedModels(Name: "SE4".obs, isSelected: false.obs),
              SelectedModels(Name: "SE5".obs, isSelected: false.obs),
              SelectedModels(Name: "SE6".obs, isSelected: false.obs),
              SelectedModels(Name: "SE7".obs, isSelected: false.obs),
              SelectedModels(Name: "SE8".obs, isSelected: false.obs),
            ]).map((e) => e.toJson()).toList()));
        getDataListSavar.value = RxList<SelectedModels>([
          SelectedModels(Name: "1".obs, isSelected: false.obs),
          SelectedModels(Name: "2".obs, isSelected: false.obs),
          SelectedModels(Name: "3".obs, isSelected: false.obs),
          SelectedModels(Name: "4".obs, isSelected: false.obs),
          SelectedModels(Name: "5".obs, isSelected: false.obs),
          SelectedModels(Name: "6".obs, isSelected: false.obs),
          SelectedModels(Name: "7".obs, isSelected: false.obs),
          SelectedModels(Name: "8".obs, isSelected: false.obs),
          SelectedModels(Name: "9".obs, isSelected: false.obs),
          SelectedModels(Name: "10".obs, isSelected: false.obs),
          SelectedModels(Name: "11".obs, isSelected: false.obs),
          SelectedModels(Name: "12".obs, isSelected: false.obs),
          SelectedModels(Name: "13".obs, isSelected: false.obs),
          SelectedModels(Name: "14".obs, isSelected: false.obs),
          SelectedModels(Name: "15".obs, isSelected: false.obs),
          SelectedModels(Name: "16".obs, isSelected: false.obs),
          SelectedModels(Name: "17".obs, isSelected: false.obs),
          SelectedModels(Name: "18".obs, isSelected: false.obs),
          SelectedModels(Name: "19".obs, isSelected: false.obs),
          SelectedModels(Name: "20".obs, isSelected: false.obs),
          SelectedModels(Name: "21".obs, isSelected: false.obs),
          SelectedModels(Name: "22".obs, isSelected: false.obs),
          SelectedModels(Name: "23".obs, isSelected: false.obs),
          SelectedModels(Name: "24".obs, isSelected: false.obs),
          SelectedModels(Name: "25".obs, isSelected: false.obs),
          SelectedModels(Name: "26".obs, isSelected: false.obs),
          SelectedModels(Name: "27".obs, isSelected: false.obs),
          SelectedModels(Name: "28".obs, isSelected: false.obs),
          SelectedModels(Name: "29".obs, isSelected: false.obs),
          SelectedModels(Name: "30".obs, isSelected: false.obs),
          SelectedModels(Name: "31".obs, isSelected: false.obs),
          SelectedModels(Name: "32".obs, isSelected: false.obs),
          SelectedModels(Name: "33".obs, isSelected: false.obs),
          SelectedModels(Name: "34".obs, isSelected: false.obs),
          SelectedModels(Name: "35".obs, isSelected: false.obs),
          SelectedModels(Name: "36".obs, isSelected: false.obs),
          SelectedModels(Name: "37".obs, isSelected: false.obs),
          SelectedModels(Name: "38".obs, isSelected: false.obs),
          SelectedModels(Name: "39".obs, isSelected: false.obs),
          SelectedModels(Name: "40".obs, isSelected: false.obs),
          SelectedModels(Name: "41".obs, isSelected: false.obs),
          SelectedModels(Name: "42".obs, isSelected: false.obs),
          SelectedModels(Name: "43".obs, isSelected: false.obs),
          SelectedModels(Name: "44".obs, isSelected: false.obs),
          SelectedModels(Name: "45".obs, isSelected: false.obs),
          SelectedModels(Name: "46".obs, isSelected: false.obs),
          SelectedModels(Name: "47".obs, isSelected: false.obs),
          SelectedModels(Name: "48".obs, isSelected: false.obs),
          SelectedModels(Name: "49".obs, isSelected: false.obs),
          SelectedModels(Name: "50".obs, isSelected: false.obs),
          SelectedModels(Name: "51".obs, isSelected: false.obs),
          SelectedModels(Name: "52".obs, isSelected: false.obs),
          SelectedModels(Name: "53".obs, isSelected: false.obs),
          SelectedModels(Name: "54".obs, isSelected: false.obs),
          SelectedModels(Name: "55".obs, isSelected: false.obs),
          SelectedModels(Name: "56".obs, isSelected: false.obs),
          SelectedModels(Name: "57".obs, isSelected: false.obs),
          SelectedModels(Name: "58".obs, isSelected: false.obs),
          SelectedModels(Name: "59".obs, isSelected: false.obs),
          SelectedModels(Name: "60".obs, isSelected: false.obs),
          SelectedModels(Name: "61".obs, isSelected: false.obs),
          SelectedModels(Name: "62".obs, isSelected: false.obs),
          SelectedModels(Name: "63".obs, isSelected: false.obs),
          SelectedModels(Name: "64".obs, isSelected: false.obs),
          SelectedModels(Name: "65".obs, isSelected: false.obs),
          SelectedModels(Name: "P1".obs, isSelected: false.obs),
          SelectedModels(Name: "P2".obs, isSelected: false.obs),
          SelectedModels(Name: "P3".obs, isSelected: false.obs),
          SelectedModels(Name: "P4".obs, isSelected: false.obs),
          SelectedModels(Name: "P5".obs, isSelected: false.obs),
          SelectedModels(Name: "P6".obs, isSelected: false.obs),
          SelectedModels(Name: "P7".obs, isSelected: false.obs),
          SelectedModels(Name: "P8".obs, isSelected: false.obs),
          SelectedModels(Name: "P9".obs, isSelected: false.obs),
          SelectedModels(Name: "P10".obs, isSelected: false.obs),
          SelectedModels(Name: "S1".obs, isSelected: false.obs),
          SelectedModels(Name: "S2".obs, isSelected: false.obs),
          SelectedModels(Name: "S3".obs, isSelected: false.obs),
          SelectedModels(Name: "S4".obs, isSelected: false.obs),
          SelectedModels(Name: "S5".obs, isSelected: false.obs),
          SelectedModels(Name: "S6".obs, isSelected: false.obs),
          SelectedModels(Name: "S7".obs, isSelected: false.obs),
          SelectedModels(Name: "S8".obs, isSelected: false.obs),
          SelectedModels(Name: "S9".obs, isSelected: false.obs),
          SelectedModels(Name: "S10".obs, isSelected: false.obs),
          SelectedModels(Name: "S11".obs, isSelected: false.obs),
          SelectedModels(Name: "S12".obs, isSelected: false.obs),
          SelectedModels(Name: "S13".obs, isSelected: false.obs),
          SelectedModels(Name: "S14".obs, isSelected: false.obs),
          SelectedModels(Name: "S15".obs, isSelected: false.obs),
          SelectedModels(Name: "S16".obs, isSelected: false.obs),
          SelectedModels(Name: "S17".obs, isSelected: false.obs),
          SelectedModels(Name: "M18".obs, isSelected: false.obs),
          SelectedModels(Name: "M19".obs, isSelected: false.obs),
          SelectedModels(Name: "M20".obs, isSelected: false.obs),
          SelectedModels(Name: "M21".obs, isSelected: false.obs),
          SelectedModels(Name: "M22".obs, isSelected: false.obs),
          SelectedModels(Name: "SE1".obs, isSelected: false.obs),
          SelectedModels(Name: "SE2".obs, isSelected: false.obs),
          SelectedModels(Name: "SE3".obs, isSelected: false.obs),
          SelectedModels(Name: "SE4".obs, isSelected: false.obs),
          SelectedModels(Name: "SE5".obs, isSelected: false.obs),
          SelectedModels(Name: "SE6".obs, isSelected: false.obs),
          SelectedModels(Name: "SE7".obs, isSelected: false.obs),
          SelectedModels(Name: "SE8".obs, isSelected: false.obs),
        ]);
      }
      if (!isNullEmptyOrFalse(
          box.read(selectedDataDate.value + ArgumentConstant.Sanj))) {
        getDataListSanj.value = ((jsonDecode(box
                        .read(selectedDataDate.value + ArgumentConstant.Sanj))
                    as List<dynamic>)
                .toList())
            .map((e) => SelectedModels.fromJson(e))
            .toList();
      } else {
        box.write(
            selectedDataDate.value + ArgumentConstant.Sanj,
            jsonEncode(RxList<SelectedModels>([
              SelectedModels(Name: "1".obs, isSelected: false.obs),
              SelectedModels(Name: "2".obs, isSelected: false.obs),
              SelectedModels(Name: "3".obs, isSelected: false.obs),
              SelectedModels(Name: "4".obs, isSelected: false.obs),
              SelectedModels(Name: "5".obs, isSelected: false.obs),
              SelectedModels(Name: "6".obs, isSelected: false.obs),
              SelectedModels(Name: "7".obs, isSelected: false.obs),
              SelectedModels(Name: "8".obs, isSelected: false.obs),
              SelectedModels(Name: "9".obs, isSelected: false.obs),
              SelectedModels(Name: "10".obs, isSelected: false.obs),
              SelectedModels(Name: "11".obs, isSelected: false.obs),
              SelectedModels(Name: "12".obs, isSelected: false.obs),
              SelectedModels(Name: "13".obs, isSelected: false.obs),
              SelectedModels(Name: "14".obs, isSelected: false.obs),
              SelectedModels(Name: "15".obs, isSelected: false.obs),
              SelectedModels(Name: "16".obs, isSelected: false.obs),
              SelectedModels(Name: "17".obs, isSelected: false.obs),
              SelectedModels(Name: "18".obs, isSelected: false.obs),
              SelectedModels(Name: "19".obs, isSelected: false.obs),
              SelectedModels(Name: "20".obs, isSelected: false.obs),
              SelectedModels(Name: "21".obs, isSelected: false.obs),
              SelectedModels(Name: "22".obs, isSelected: false.obs),
              SelectedModels(Name: "23".obs, isSelected: false.obs),
              SelectedModels(Name: "24".obs, isSelected: false.obs),
              SelectedModels(Name: "25".obs, isSelected: false.obs),
              SelectedModels(Name: "26".obs, isSelected: false.obs),
              SelectedModels(Name: "27".obs, isSelected: false.obs),
              SelectedModels(Name: "28".obs, isSelected: false.obs),
              SelectedModels(Name: "29".obs, isSelected: false.obs),
              SelectedModels(Name: "30".obs, isSelected: false.obs),
              SelectedModels(Name: "31".obs, isSelected: false.obs),
              SelectedModels(Name: "32".obs, isSelected: false.obs),
              SelectedModels(Name: "33".obs, isSelected: false.obs),
              SelectedModels(Name: "34".obs, isSelected: false.obs),
              SelectedModels(Name: "35".obs, isSelected: false.obs),
              SelectedModels(Name: "36".obs, isSelected: false.obs),
              SelectedModels(Name: "37".obs, isSelected: false.obs),
              SelectedModels(Name: "38".obs, isSelected: false.obs),
              SelectedModels(Name: "39".obs, isSelected: false.obs),
              SelectedModels(Name: "40".obs, isSelected: false.obs),
              SelectedModels(Name: "41".obs, isSelected: false.obs),
              SelectedModels(Name: "42".obs, isSelected: false.obs),
              SelectedModels(Name: "43".obs, isSelected: false.obs),
              SelectedModels(Name: "44".obs, isSelected: false.obs),
              SelectedModels(Name: "45".obs, isSelected: false.obs),
              SelectedModels(Name: "46".obs, isSelected: false.obs),
              SelectedModels(Name: "47".obs, isSelected: false.obs),
              SelectedModels(Name: "48".obs, isSelected: false.obs),
              SelectedModels(Name: "49".obs, isSelected: false.obs),
              SelectedModels(Name: "50".obs, isSelected: false.obs),
              SelectedModels(Name: "51".obs, isSelected: false.obs),
              SelectedModels(Name: "52".obs, isSelected: false.obs),
              SelectedModels(Name: "53".obs, isSelected: false.obs),
              SelectedModels(Name: "54".obs, isSelected: false.obs),
              SelectedModels(Name: "55".obs, isSelected: false.obs),
              SelectedModels(Name: "56".obs, isSelected: false.obs),
              SelectedModels(Name: "57".obs, isSelected: false.obs),
              SelectedModels(Name: "58".obs, isSelected: false.obs),
              SelectedModels(Name: "59".obs, isSelected: false.obs),
              SelectedModels(Name: "60".obs, isSelected: false.obs),
              SelectedModels(Name: "61".obs, isSelected: false.obs),
              SelectedModels(Name: "62".obs, isSelected: false.obs),
              SelectedModels(Name: "63".obs, isSelected: false.obs),
              SelectedModels(Name: "64".obs, isSelected: false.obs),
              SelectedModels(Name: "65".obs, isSelected: false.obs),
              SelectedModels(Name: "P1".obs, isSelected: false.obs),
              SelectedModels(Name: "P2".obs, isSelected: false.obs),
              SelectedModels(Name: "P3".obs, isSelected: false.obs),
              SelectedModels(Name: "P4".obs, isSelected: false.obs),
              SelectedModels(Name: "P5".obs, isSelected: false.obs),
              SelectedModels(Name: "P6".obs, isSelected: false.obs),
              SelectedModels(Name: "P7".obs, isSelected: false.obs),
              SelectedModels(Name: "P8".obs, isSelected: false.obs),
              SelectedModels(Name: "P9".obs, isSelected: false.obs),
              SelectedModels(Name: "P10".obs, isSelected: false.obs),
              SelectedModels(Name: "S1".obs, isSelected: false.obs),
              SelectedModels(Name: "S2".obs, isSelected: false.obs),
              SelectedModels(Name: "S3".obs, isSelected: false.obs),
              SelectedModels(Name: "S4".obs, isSelected: false.obs),
              SelectedModels(Name: "S5".obs, isSelected: false.obs),
              SelectedModels(Name: "S6".obs, isSelected: false.obs),
              SelectedModels(Name: "S7".obs, isSelected: false.obs),
              SelectedModels(Name: "S8".obs, isSelected: false.obs),
              SelectedModels(Name: "S9".obs, isSelected: false.obs),
              SelectedModels(Name: "S10".obs, isSelected: false.obs),
              SelectedModels(Name: "S11".obs, isSelected: false.obs),
              SelectedModels(Name: "S12".obs, isSelected: false.obs),
              SelectedModels(Name: "S13".obs, isSelected: false.obs),
              SelectedModels(Name: "S14".obs, isSelected: false.obs),
              SelectedModels(Name: "S15".obs, isSelected: false.obs),
              SelectedModels(Name: "S16".obs, isSelected: false.obs),
              SelectedModels(Name: "S17".obs, isSelected: false.obs),
              SelectedModels(Name: "M18".obs, isSelected: false.obs),
              SelectedModels(Name: "M19".obs, isSelected: false.obs),
              SelectedModels(Name: "M20".obs, isSelected: false.obs),
              SelectedModels(Name: "M21".obs, isSelected: false.obs),
              SelectedModels(Name: "M22".obs, isSelected: false.obs),
              SelectedModels(Name: "SE1".obs, isSelected: false.obs),
              SelectedModels(Name: "SE2".obs, isSelected: false.obs),
              SelectedModels(Name: "SE3".obs, isSelected: false.obs),
              SelectedModels(Name: "SE4".obs, isSelected: false.obs),
              SelectedModels(Name: "SE5".obs, isSelected: false.obs),
              SelectedModels(Name: "SE6".obs, isSelected: false.obs),
              SelectedModels(Name: "SE7".obs, isSelected: false.obs),
              SelectedModels(Name: "SE8".obs, isSelected: false.obs),
            ]).map((e) => e.toJson()).toList()));
        getDataListSanj.value = RxList<SelectedModels>([
          SelectedModels(Name: "1".obs, isSelected: false.obs),
          SelectedModels(Name: "2".obs, isSelected: false.obs),
          SelectedModels(Name: "3".obs, isSelected: false.obs),
          SelectedModels(Name: "4".obs, isSelected: false.obs),
          SelectedModels(Name: "5".obs, isSelected: false.obs),
          SelectedModels(Name: "6".obs, isSelected: false.obs),
          SelectedModels(Name: "7".obs, isSelected: false.obs),
          SelectedModels(Name: "8".obs, isSelected: false.obs),
          SelectedModels(Name: "9".obs, isSelected: false.obs),
          SelectedModels(Name: "10".obs, isSelected: false.obs),
          SelectedModels(Name: "11".obs, isSelected: false.obs),
          SelectedModels(Name: "12".obs, isSelected: false.obs),
          SelectedModels(Name: "13".obs, isSelected: false.obs),
          SelectedModels(Name: "14".obs, isSelected: false.obs),
          SelectedModels(Name: "15".obs, isSelected: false.obs),
          SelectedModels(Name: "16".obs, isSelected: false.obs),
          SelectedModels(Name: "17".obs, isSelected: false.obs),
          SelectedModels(Name: "18".obs, isSelected: false.obs),
          SelectedModels(Name: "19".obs, isSelected: false.obs),
          SelectedModels(Name: "20".obs, isSelected: false.obs),
          SelectedModels(Name: "21".obs, isSelected: false.obs),
          SelectedModels(Name: "22".obs, isSelected: false.obs),
          SelectedModels(Name: "23".obs, isSelected: false.obs),
          SelectedModels(Name: "24".obs, isSelected: false.obs),
          SelectedModels(Name: "25".obs, isSelected: false.obs),
          SelectedModels(Name: "26".obs, isSelected: false.obs),
          SelectedModels(Name: "27".obs, isSelected: false.obs),
          SelectedModels(Name: "28".obs, isSelected: false.obs),
          SelectedModels(Name: "29".obs, isSelected: false.obs),
          SelectedModels(Name: "30".obs, isSelected: false.obs),
          SelectedModels(Name: "31".obs, isSelected: false.obs),
          SelectedModels(Name: "32".obs, isSelected: false.obs),
          SelectedModels(Name: "33".obs, isSelected: false.obs),
          SelectedModels(Name: "34".obs, isSelected: false.obs),
          SelectedModels(Name: "35".obs, isSelected: false.obs),
          SelectedModels(Name: "36".obs, isSelected: false.obs),
          SelectedModels(Name: "37".obs, isSelected: false.obs),
          SelectedModels(Name: "38".obs, isSelected: false.obs),
          SelectedModels(Name: "39".obs, isSelected: false.obs),
          SelectedModels(Name: "40".obs, isSelected: false.obs),
          SelectedModels(Name: "41".obs, isSelected: false.obs),
          SelectedModels(Name: "42".obs, isSelected: false.obs),
          SelectedModels(Name: "43".obs, isSelected: false.obs),
          SelectedModels(Name: "44".obs, isSelected: false.obs),
          SelectedModels(Name: "45".obs, isSelected: false.obs),
          SelectedModels(Name: "46".obs, isSelected: false.obs),
          SelectedModels(Name: "47".obs, isSelected: false.obs),
          SelectedModels(Name: "48".obs, isSelected: false.obs),
          SelectedModels(Name: "49".obs, isSelected: false.obs),
          SelectedModels(Name: "50".obs, isSelected: false.obs),
          SelectedModels(Name: "51".obs, isSelected: false.obs),
          SelectedModels(Name: "52".obs, isSelected: false.obs),
          SelectedModels(Name: "53".obs, isSelected: false.obs),
          SelectedModels(Name: "54".obs, isSelected: false.obs),
          SelectedModels(Name: "55".obs, isSelected: false.obs),
          SelectedModels(Name: "56".obs, isSelected: false.obs),
          SelectedModels(Name: "57".obs, isSelected: false.obs),
          SelectedModels(Name: "58".obs, isSelected: false.obs),
          SelectedModels(Name: "59".obs, isSelected: false.obs),
          SelectedModels(Name: "60".obs, isSelected: false.obs),
          SelectedModels(Name: "61".obs, isSelected: false.obs),
          SelectedModels(Name: "62".obs, isSelected: false.obs),
          SelectedModels(Name: "63".obs, isSelected: false.obs),
          SelectedModels(Name: "64".obs, isSelected: false.obs),
          SelectedModels(Name: "65".obs, isSelected: false.obs),
          SelectedModels(Name: "P1".obs, isSelected: false.obs),
          SelectedModels(Name: "P2".obs, isSelected: false.obs),
          SelectedModels(Name: "P3".obs, isSelected: false.obs),
          SelectedModels(Name: "P4".obs, isSelected: false.obs),
          SelectedModels(Name: "P5".obs, isSelected: false.obs),
          SelectedModels(Name: "P6".obs, isSelected: false.obs),
          SelectedModels(Name: "P7".obs, isSelected: false.obs),
          SelectedModels(Name: "P8".obs, isSelected: false.obs),
          SelectedModels(Name: "P9".obs, isSelected: false.obs),
          SelectedModels(Name: "P10".obs, isSelected: false.obs),
          SelectedModels(Name: "S1".obs, isSelected: false.obs),
          SelectedModels(Name: "S2".obs, isSelected: false.obs),
          SelectedModels(Name: "S3".obs, isSelected: false.obs),
          SelectedModels(Name: "S4".obs, isSelected: false.obs),
          SelectedModels(Name: "S5".obs, isSelected: false.obs),
          SelectedModels(Name: "S6".obs, isSelected: false.obs),
          SelectedModels(Name: "S7".obs, isSelected: false.obs),
          SelectedModels(Name: "S8".obs, isSelected: false.obs),
          SelectedModels(Name: "S9".obs, isSelected: false.obs),
          SelectedModels(Name: "S10".obs, isSelected: false.obs),
          SelectedModels(Name: "S11".obs, isSelected: false.obs),
          SelectedModels(Name: "S12".obs, isSelected: false.obs),
          SelectedModels(Name: "S13".obs, isSelected: false.obs),
          SelectedModels(Name: "S14".obs, isSelected: false.obs),
          SelectedModels(Name: "S15".obs, isSelected: false.obs),
          SelectedModels(Name: "S16".obs, isSelected: false.obs),
          SelectedModels(Name: "S17".obs, isSelected: false.obs),
          SelectedModels(Name: "M18".obs, isSelected: false.obs),
          SelectedModels(Name: "M19".obs, isSelected: false.obs),
          SelectedModels(Name: "M20".obs, isSelected: false.obs),
          SelectedModels(Name: "M21".obs, isSelected: false.obs),
          SelectedModels(Name: "M22".obs, isSelected: false.obs),
          SelectedModels(Name: "SE1".obs, isSelected: false.obs),
          SelectedModels(Name: "SE2".obs, isSelected: false.obs),
          SelectedModels(Name: "SE3".obs, isSelected: false.obs),
          SelectedModels(Name: "SE4".obs, isSelected: false.obs),
          SelectedModels(Name: "SE5".obs, isSelected: false.obs),
          SelectedModels(Name: "SE6".obs, isSelected: false.obs),
          SelectedModels(Name: "SE7".obs, isSelected: false.obs),
          SelectedModels(Name: "SE8".obs, isSelected: false.obs),
        ]);
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
            jsonEncode(RxList<SelectedModels>([
              SelectedModels(Name: "1".obs, isSelected: false.obs),
              SelectedModels(Name: "2".obs, isSelected: false.obs),
              SelectedModels(Name: "3".obs, isSelected: false.obs),
              SelectedModels(Name: "4".obs, isSelected: false.obs),
              SelectedModels(Name: "5".obs, isSelected: false.obs),
              SelectedModels(Name: "6".obs, isSelected: false.obs),
              SelectedModels(Name: "7".obs, isSelected: false.obs),
              SelectedModels(Name: "8".obs, isSelected: false.obs),
              SelectedModels(Name: "9".obs, isSelected: false.obs),
              SelectedModels(Name: "10".obs, isSelected: false.obs),
              SelectedModels(Name: "11".obs, isSelected: false.obs),
              SelectedModels(Name: "12".obs, isSelected: false.obs),
              SelectedModels(Name: "13".obs, isSelected: false.obs),
              SelectedModels(Name: "14".obs, isSelected: false.obs),
              SelectedModels(Name: "15".obs, isSelected: false.obs),
              SelectedModels(Name: "16".obs, isSelected: false.obs),
              SelectedModels(Name: "17".obs, isSelected: false.obs),
              SelectedModels(Name: "18".obs, isSelected: false.obs),
              SelectedModels(Name: "19".obs, isSelected: false.obs),
              SelectedModels(Name: "20".obs, isSelected: false.obs),
              SelectedModels(Name: "21".obs, isSelected: false.obs),
              SelectedModels(Name: "22".obs, isSelected: false.obs),
              SelectedModels(Name: "23".obs, isSelected: false.obs),
              SelectedModels(Name: "24".obs, isSelected: false.obs),
              SelectedModels(Name: "25".obs, isSelected: false.obs),
              SelectedModels(Name: "26".obs, isSelected: false.obs),
              SelectedModels(Name: "27".obs, isSelected: false.obs),
              SelectedModels(Name: "28".obs, isSelected: false.obs),
              SelectedModels(Name: "29".obs, isSelected: false.obs),
              SelectedModels(Name: "30".obs, isSelected: false.obs),
              SelectedModels(Name: "31".obs, isSelected: false.obs),
              SelectedModels(Name: "32".obs, isSelected: false.obs),
              SelectedModels(Name: "33".obs, isSelected: false.obs),
              SelectedModels(Name: "34".obs, isSelected: false.obs),
              SelectedModels(Name: "35".obs, isSelected: false.obs),
              SelectedModels(Name: "36".obs, isSelected: false.obs),
              SelectedModels(Name: "37".obs, isSelected: false.obs),
              SelectedModels(Name: "38".obs, isSelected: false.obs),
              SelectedModels(Name: "39".obs, isSelected: false.obs),
              SelectedModels(Name: "40".obs, isSelected: false.obs),
              SelectedModels(Name: "41".obs, isSelected: false.obs),
              SelectedModels(Name: "42".obs, isSelected: false.obs),
              SelectedModels(Name: "43".obs, isSelected: false.obs),
              SelectedModels(Name: "44".obs, isSelected: false.obs),
              SelectedModels(Name: "45".obs, isSelected: false.obs),
              SelectedModels(Name: "46".obs, isSelected: false.obs),
              SelectedModels(Name: "47".obs, isSelected: false.obs),
              SelectedModels(Name: "48".obs, isSelected: false.obs),
              SelectedModels(Name: "49".obs, isSelected: false.obs),
              SelectedModels(Name: "50".obs, isSelected: false.obs),
              SelectedModels(Name: "51".obs, isSelected: false.obs),
              SelectedModels(Name: "52".obs, isSelected: false.obs),
              SelectedModels(Name: "53".obs, isSelected: false.obs),
              SelectedModels(Name: "54".obs, isSelected: false.obs),
              SelectedModels(Name: "55".obs, isSelected: false.obs),
              SelectedModels(Name: "56".obs, isSelected: false.obs),
              SelectedModels(Name: "57".obs, isSelected: false.obs),
              SelectedModels(Name: "58".obs, isSelected: false.obs),
              SelectedModels(Name: "59".obs, isSelected: false.obs),
              SelectedModels(Name: "60".obs, isSelected: false.obs),
              SelectedModels(Name: "61".obs, isSelected: false.obs),
              SelectedModels(Name: "62".obs, isSelected: false.obs),
              SelectedModels(Name: "63".obs, isSelected: false.obs),
              SelectedModels(Name: "64".obs, isSelected: false.obs),
              SelectedModels(Name: "65".obs, isSelected: false.obs),
              SelectedModels(Name: "P1".obs, isSelected: false.obs),
              SelectedModels(Name: "P2".obs, isSelected: false.obs),
              SelectedModels(Name: "P3".obs, isSelected: false.obs),
              SelectedModels(Name: "P4".obs, isSelected: false.obs),
              SelectedModels(Name: "P5".obs, isSelected: false.obs),
              SelectedModels(Name: "P6".obs, isSelected: false.obs),
              SelectedModels(Name: "P7".obs, isSelected: false.obs),
              SelectedModels(Name: "P8".obs, isSelected: false.obs),
              SelectedModels(Name: "P9".obs, isSelected: false.obs),
              SelectedModels(Name: "P10".obs, isSelected: false.obs),
              SelectedModels(Name: "S1".obs, isSelected: false.obs),
              SelectedModels(Name: "S2".obs, isSelected: false.obs),
              SelectedModels(Name: "S3".obs, isSelected: false.obs),
              SelectedModels(Name: "S4".obs, isSelected: false.obs),
              SelectedModels(Name: "S5".obs, isSelected: false.obs),
              SelectedModels(Name: "S6".obs, isSelected: false.obs),
              SelectedModels(Name: "S7".obs, isSelected: false.obs),
              SelectedModels(Name: "S8".obs, isSelected: false.obs),
              SelectedModels(Name: "S9".obs, isSelected: false.obs),
              SelectedModels(Name: "S10".obs, isSelected: false.obs),
              SelectedModels(Name: "S11".obs, isSelected: false.obs),
              SelectedModels(Name: "S12".obs, isSelected: false.obs),
              SelectedModels(Name: "S13".obs, isSelected: false.obs),
              SelectedModels(Name: "S14".obs, isSelected: false.obs),
              SelectedModels(Name: "S15".obs, isSelected: false.obs),
              SelectedModels(Name: "S16".obs, isSelected: false.obs),
              SelectedModels(Name: "S17".obs, isSelected: false.obs),
              SelectedModels(Name: "M18".obs, isSelected: false.obs),
              SelectedModels(Name: "M19".obs, isSelected: false.obs),
              SelectedModels(Name: "M20".obs, isSelected: false.obs),
              SelectedModels(Name: "M21".obs, isSelected: false.obs),
              SelectedModels(Name: "M22".obs, isSelected: false.obs),
              SelectedModels(Name: "SE1".obs, isSelected: false.obs),
              SelectedModels(Name: "SE2".obs, isSelected: false.obs),
              SelectedModels(Name: "SE3".obs, isSelected: false.obs),
              SelectedModels(Name: "SE4".obs, isSelected: false.obs),
              SelectedModels(Name: "SE5".obs, isSelected: false.obs),
              SelectedModels(Name: "SE6".obs, isSelected: false.obs),
              SelectedModels(Name: "SE7".obs, isSelected: false.obs),
              SelectedModels(Name: "SE8".obs, isSelected: false.obs),
            ]).map((e) => e.toJson()).toList()));
        list.clear();

        list.addAll(List.generate(
          105,
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
