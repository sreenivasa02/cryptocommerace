import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data_utils/data_list.dart';

class HomeController extends GetxController {

  final List<Map<String, dynamic>> trendingCoins =DataList.dataList;
 final box = GetStorage();
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




}
