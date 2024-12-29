import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../../../custome_widgets/crypto_tile_card_view.dart';
import '../controllers/todo_controller.dart';

class TodoView extends GetView<TodoController> {
  TodoView({Key? key}) : super(key: key);
  final TodoController controller = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Obx(() => Text.rich(
          TextSpan(
            text: 'Market is ',
            style: TextStyle(color: Colors.black, fontSize: 18),
            children: [
              TextSpan(
                text: controller.isMarketDown.value ? 'down ' : 'up ',
                style: TextStyle(
                    color: controller.isMarketDown.value
                        ? Colors.red
                        : Colors.greenAccent,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text:
                '${controller.marketChangePercentage.value.toStringAsFixed(2)}%',
                style: TextStyle(
                    color: controller.isMarketDown.value
                        ? Colors.red
                        : Colors.green,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'In the past 24 hours',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Coins', style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900)),
                DropdownButton<String>(
                  value: 'Market- INR',
                  underline: SizedBox(),
                  items: ['Market- INR', 'Market- USD']
                      .map((e) => DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  ))
                      .toList(),
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['All', 'Gainer', 'Loser', 'Favourites']
                  .map((tab) => Obx(() => TextButton(
                onPressed: () {
                  controller.selectedTab.value = tab;
                },
                child: Text(
                  tab,
                  style: TextStyle(
                    color: controller.selectedTab.value == tab
                        ? Colors.purple
                        : Colors.black,
                  ),
                ),
              )))
                  .toList(),
            ),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: controller.coins.length,
              itemBuilder: (context, index) {
                final coin = controller.coins[index];
                return CryptoTile(
                  icon: coin['icon'],
                  name: coin['name'],
                  code: coin['code'],
                  price: coin['price'],
                  change: coin['change'],
                  isUp: coin['isUp'],
                );
              },
            )),
          ),
        ],
      ),
    );
  }
}

