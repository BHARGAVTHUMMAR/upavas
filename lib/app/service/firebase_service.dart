import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../modules/home/controllers/home_controller.dart';

class FirebaseService {
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

  Future<List<SelectedModels>> getUserData(
      {required String date, BuildContext? context}) async {
    List<SelectedModels> selectedList = [];
    selectedList.clear();
    await firebaseFireStore.collection("upavas").doc(date).get().then((value) {
      if (value.data() != null) {
        List l = value.data()!["data"];
        l.forEach((element) {
          selectedList.add(SelectedModels.fromJson(element));
        });
      }
    });
    return selectedList;
  }

  Future<void> addUserDataToFireStore(
      {required String date, required Map<String, dynamic> data}) async {
    return await firebaseFireStore
        .collection("upavas")
        .doc(date.toString())
        .set(data);
  }

  Future<void> updateUserDataToFireStore(
      {required String date, required Map<String, dynamic> data}) async {
    return await firebaseFireStore
        .collection("upavas")
        .doc(date.toString())
        .update(data);
  }
}
