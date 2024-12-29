import 'package:c_commerce/app/modules/MainScreen/controllers/main_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Home/controllers/home_controller.dart';

class FormView extends GetView {


  @override
  Widget build(BuildContext context) {
    final MainScreenController controller = Get.put(MainScreenController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.purple[200],
        title: Text('Add Crypto', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: controller.nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.codeController,
                decoration: const InputDecoration(labelText: 'Code'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a code';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.amountController,
                decoration: const InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.changeController,
                decoration: const InputDecoration(labelText: 'Change'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a change percentage';
                  }
                  return null;
                },
              ),
              Obx(() {
                return Row(
                  children: [
                    const Text('Is the change up?'),
                    Switch(
                      activeColor: Colors.indigo,
                      value: controller.isUp.value,
                      onChanged: (value) {
                        controller.isUp.value = value;
                      },
                    ),
                  ],
                );
              }),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.indigo),
                onPressed:(){
                  controller.submitForm();
                  Get.back();
                  Get.snackbar(
                    'Success',
                    'Form submitted successfully!',
                    colorText: Colors.white,
                    backgroundColor: Colors.green,
                  );
                  },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
