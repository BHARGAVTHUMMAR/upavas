import 'package:get/get.dart';

import '../modules/Add_Upvas/bindings/add_upvas_binding.dart';
import '../modules/Add_Upvas/views/add_upvas_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/mainhome/bindings/mainhome_binding.dart';
import '../modules/mainhome/views/mainhome_view.dart';
import '../modules/upavaslist/bindings/upavaslist_binding.dart';
import '../modules/upavaslist/views/upavaslist_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAINHOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MAINHOME,
      page: () => const MainhomeView(),
      binding: MainhomeBinding(),
    ),
    GetPage(
      name: _Paths.UPAVASLIST,
      page: () => const UpavaslistView(),
      binding: UpavaslistBinding(),
    ),
    GetPage(
      name: _Paths.ADD_UPVAS,
      page: () => const AddUpvasView(),
      binding: AddUpvasBinding(),
    ),
  ];
}
