import 'dart:math';
import 'package:c_commerce/app/modules/Login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../utils/custome_widgets/crypto_tile_card_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
   HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Home', style: TextStyle(color: Colors.black)),
          actions: [IconButton(onPressed: (){
            print("logout()");
            Get.put(LoginController()).logout();

            },
          icon: Icon(Icons.logout),color: Colors.black,)]
      ),
      body: SingleChildScrollView(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            _buildWelcomeCard(),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("Trending Coins", style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w900)),
            ),

                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.trendingCoins.length,
                  itemBuilder: (context, index) {
                    final coin = controller.trendingCoins[index];
                    return CryptoTile(
                      icon: coin['icon'] as IconData,
                      name: coin['name'] as String,
                      code: '${coin['code']}',
                      price: coin['price'] as String,
                      change: coin['change'] as String,
                      isUp: coin['isUp'] as bool,
                    );
                  },
                ),

          ],
        ),
      ),
    );
  }
  Widget _buildWelcomeCard() {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome ${controller.box.read('email')?.split('@')[0]?.toLowerCase().split(' ').map((word) => word[0].toUpperCase() + word.substring(1)).join(' ')},",
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          SizedBox(height: 8.0),
          Text(
            "Make your first Investment today",
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(primary: Colors.white),
            child: Text(
              "Invest Today",
              style: TextStyle(color: Colors.purple),
            ),
          ),
        ],
      ),
    );
  }


}
