import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:upvas/app/modules/home/views/home_view.dart';
import 'package:upvas/app/modules/upavaslist/views/upavaslist_view.dart';

import '../controllers/mainhome_controller.dart';

class MainhomeView extends GetView<MainhomeController> {
  const MainhomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.green,
          title: const Text('UPAVAS'),
          centerTitle: true,
          bottom: TabBar(indicatorColor: Colors.white,tabs: [Tab(child: Text("Home")),Tab(child: Text("Upavas List"))]),
        ),
        body:  TabBarView(children: [
          HomeView(),
          UpavaslistView()
        ]),
      ),
    );
  }
}
