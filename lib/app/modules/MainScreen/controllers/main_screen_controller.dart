import 'package:c_commerce/app/modules/Dashboard/views/dashboard_view.dart';
import 'package:c_commerce/app/modules/Home/views/home_view.dart';
import 'package:c_commerce/app/modules/portfilio/views/portfilio_view.dart';
import 'package:c_commerce/app/modules/todo/views/todo_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController {
  var currentIndex = 0.obs;

  final List<Widget> screens = [
    HomeView(),
    PortfilioView(),
    TodoView(),
    DashboardView(),
  ];

  void changeScreen(int index) {
    currentIndex.value = index;
  }
}
