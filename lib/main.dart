import 'package:c_commerce/app/modules/Home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'app/modules/Login/views/login_view.dart';

void main() async {

  await GetStorage.init(); // Initialize GetStorage if needed
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/login', page: () => LoginView()),
       ],
      home: LoginView(),
      builder: (context, child) {
        return InternetConnectivityChecker(child: child!);
      },
    );

  }
}
class InternetConnectivityCheckerController extends GetxController {
  var isConnected = true.obs;

  @override
  void onInit() {
    super.onInit();
    _checkConnectivity();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      isConnected.value = result != ConnectivityResult.none;
      if (!isConnected.value) {
        print('No Internet');

      }else{
        Get.snackbar(
          "Internet",
          " Internet connected.",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
        );
      }
    });
  }

  Future<void> _checkConnectivity() async {
    final result = await Connectivity().checkConnectivity();
    isConnected.value = result != ConnectivityResult.none;
  }


}
class InternetConnectivityChecker extends StatelessWidget {
  final Widget child;

  const InternetConnectivityChecker({required this.child});

  @override
  Widget build(BuildContext context) {
    Get.put(InternetConnectivityCheckerController()); // Initialize the Controller
    return Obx(() {
      final isConnected = Get.find<InternetConnectivityCheckerController>().isConnected.value;
      return Stack(
        children: [
          child,
          if (!isConnected)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.red,
                // padding: EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.wifi_off, color: Colors.white),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Text(
                          'Please connect to the internet',
                          style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'Airel'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      );
    });
  }
}