import 'package:get/get.dart';

import '../modules/Dashboard/bindings/dashboard_binding.dart';
import '../modules/Dashboard/views/dashboard_view.dart';
import '../modules/Home/bindings/home_binding.dart';
import '../modules/Home/views/home_view.dart';
import '../modules/Login/bindings/login_binding.dart';
import '../modules/Login/views/login_view.dart';
import '../modules/MainScreen/bindings/main_screen_binding.dart';
import '../modules/MainScreen/views/main_screen_view.dart';
import '../modules/portfilio/bindings/portfilio_binding.dart';
import '../modules/portfilio/views/portfilio_view.dart';
import '../modules/todo/bindings/todo_binding.dart';
import '../modules/todo/views/todo_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PORTFILIO,
      page: () => PortfilioView(),
      binding: PortfilioBinding(),
    ),
    GetPage(
      name: _Paths.TODO,
      page: () => TodoView(),
      binding: TodoBinding(),
    ),

    GetPage(
      name: _Paths.MAIN_SCREEN,
      page: () => MainScreenView(),
      binding: MainScreenBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () =>  DashboardView(),
      binding: DashboardBinding(),
    ),
  ];
}
