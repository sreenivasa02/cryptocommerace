import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data_utils/data_list.dart';

class TodoController extends GetxController {
  var isMarketDown = true.obs;
  var marketChangePercentage = (-11.17).obs;
  var selectedTab = 'All'.obs;

  final List<Map<String, dynamic>> allCoins =DataList.dataList;
  var coins = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    filterCoins();
    selectedTab.listen((_) => filterCoins());
  }

  void filterCoins() {
    switch (selectedTab.value) {
      case 'Gainer':
        coins.value = allCoins.where((coin) => coin['isUp'] == true).toList();
        break;
      case 'Loser':
        coins.value = allCoins.where((coin) => coin['isUp'] == false).toList();
        break;
      case 'Favourites':
            coins.value = allCoins.where((coin) => coin['name'] == 'Bitcoin').toList();
        break;
      default:
        coins.value = allCoins;
    }
  }
}
