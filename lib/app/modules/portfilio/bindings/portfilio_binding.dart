import 'package:get/get.dart';

import '../controllers/portfilio_controller.dart';

class PortfilioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PortfilioController>(
      () => PortfilioController(),
    );
  }
}
