import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../service/firebase_service.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          appBar: AppBar(
            title: const Text('UPAVAS'),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Center(
                  child: Text(
                      controller.selectedList
                          .where((element) {
                            return element.isSelected.isFalse;
                          })
                          .toList()
                          .length
                          .toString(),
                      style: TextStyle(fontSize: 20)),
                ),
              )
            ],
            centerTitle: true,
          ),
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
                          child: InkWell(
                            onTap: () {
                              controller.datePick(context: context);
                            },
                            child: Row(
                              children: [
                                Icon(Icons.date_range),
                                SizedBox(width: 10),
                                Text(controller.selectedDate.value,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            (controller.dropdownValue.value == "Morning")
                                ? Icon(Icons.sunny)
                                : Icon(Icons.sunny_snowing),
                            SizedBox(width: 10),
                            DropdownButton<String>(
                              value: controller.dropdownValue.value,
                              elevation: 16,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
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
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                        itemCount: controller.selectedList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () async {
                              controller.selectedList[index].isSelected
                                  .toggle();
                              await FirebaseService().updateUserDataToFireStore(
                                  date: controller.selectedDate.value +
                                      "_" +
                                      controller.dropdownValue.value.toString(),
                                  data: {
                                    "data": controller.selectedList
                                        .map((e) => e.toJson())
                                        .toList()
                                  });
                            },
                            child: Obx(() {
                              return Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (controller.selectedList[index]
                                            .isSelected.isFalse)
                                        ? Colors.green
                                        : Colors.grey,
                                  ),
                                  child: Center(
                                      child: Text(
                                    index.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )));
                            }),
                          );
                        },
                      ),
                    )
                  ],
                ));
    });
  }
}
