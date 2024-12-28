import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_screen_controller.dart';
import 'form_view.dart';

class MainScreenView extends GetView<MainScreenController> {
  final MainScreenController controller = Get.put(MainScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: controller.screens[controller.currentIndex.value],
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomNavigationBar(
            selectedFontSize: 16,
            unselectedFontSize: 14,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.purple[200],
            selectedItemColor: Colors.indigo,
            unselectedItemColor: Colors.white,
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeScreen,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Portfolio'),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: 'ToDo'),
              BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'DashBoard'),
            ],
          ),
          Positioned(
            top: -30,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: FloatingActionButton(
              onPressed: () {
                print("FormView()");
                Get.to(() => FormView());
              },
              backgroundColor: Colors.purple,
              child: Icon(Icons.add, size: 32),
            ),
          ),
        ],
      ),
    ));
  }
}

