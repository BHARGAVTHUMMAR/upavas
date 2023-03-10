import 'package:get/get.dart';

import '../controllers/upavaslist_controller.dart';

class UpavaslistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpavaslistController>(
      () => UpavaslistController(),
    );
  }
}
