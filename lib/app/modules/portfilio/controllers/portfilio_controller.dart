
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data_utils/data_list.dart';

class PortfilioController extends GetxController {
  var holdingValue = 2509.75.obs;
  var holdingChangePercentage = 9.77.obs;
  var investedValue = 1618.75.obs;
  var availableINR = 1589.obs;

  var coins = DataList.dataList;
      /*[
    {
      'icon': Icons.token,
      'name': 'Ethereum',
      'code': 'ETH',
      'amount': '0.000458',
      'price': '₹1,085.18',
      'change': '-21.00%',
      'isUp': false,
    },
    {
      'icon': Icons.circle,
      'name': 'Cardano',
      'code': 'ADA',
      'amount': '18.698',
      'price': '₹886.127',
      'change': '+16.31%',
      'isUp': true,
    },
    {
      'icon': Icons.trending_down,
      'name': 'TRON',
      'code': 'TRX',
      'amount': '10.589',
      'price': '₹50.529',
      'change': '-16.58%',
      'isUp': false,
    },
    {
      'icon': Icons.attach_money,
      'name': 'Dogecoin',
      'code': 'DOGE',
      'amount': '5.485',
      'price': '₹589.39',
      'change': '+120.00%',
      'isUp': true,
    },
  ].obs;*/

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
