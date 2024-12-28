import 'package:c_commerce/utils/data_utils/data_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormView extends GetView {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _codeController = TextEditingController();
  final _amountController = TextEditingController();
  final _priceController = TextEditingController();
  final _changeController = TextEditingController();
  final RxBool _isUp = true.obs;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {

      var newData = {
        'icon': Icons.star,
        'name': _nameController.text,
        'code': _codeController.text,
        'amount': _amountController.text,
        'price': _priceController.text,
        'change': (_isUp.value ? '+' : '-') + _changeController.text + '%',
        'isUp': _isUp.value,
      };

      DataList.dataList.add(newData);

      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
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
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _codeController,
                decoration: const InputDecoration(labelText: 'Code'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a code';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _amountController,
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
                controller: _priceController,
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
                controller: _changeController,
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
                      value: _isUp.value,
                      onChanged: (value) {
                        _isUp.value = value;
                      },
                    ),
                  ],
                );
              }),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.indigo),
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
