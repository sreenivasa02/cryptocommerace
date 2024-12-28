import 'package:c_commerce/app/modules/Login/views/login_view.dart';
import 'package:c_commerce/utils/data_utils/data_list.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
