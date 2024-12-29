import 'package:c_commerce/app/modules/Dashboard/views/dashboard_view.dart';
import 'package:c_commerce/app/modules/Home/views/home_view.dart';
import 'package:c_commerce/app/modules/portfilio/views/portfilio_view.dart';
import 'package:c_commerce/app/modules/todo/views/todo_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/data_utils/data_list.dart';

class MainScreenController extends GetxController {
  var currentIndex = 0.obs;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final codeController = TextEditingController();
  final amountController = TextEditingController();
  final priceController = TextEditingController();
  final changeController = TextEditingController();
  final RxBool isUp = true.obs;

  void submitForm() {
    if (formKey.currentState!.validate()) {

      var newData = {
        'icon': Icons.star,
        'name': nameController.text,
        'code': codeController.text,
        'amount': amountController.text,
        'price': priceController.text,
        'change': (isUp.value ? '+' : '-') + changeController.text + '%',
        'isUp': isUp.value,
      };

      DataList.dataList.add(newData);

      clearFiledValues();
    }
  }
  final List<Widget> screens = [
    HomeView(),
    PortfilioView(),
    TodoView(),
    DashboardView(),
  ];

  void changeScreen(int index) {
    currentIndex.value = index;
  }
  void clearFiledValues(){
    nameController.clear();
    codeController.clear();
    amountController.clear();
    priceController.clear();
     changeController.clear();
     isUp.value=true;
  }
}
