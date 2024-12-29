import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../custome_widgets/crypto_tile_card_view.dart';
import '../../todo/views/todo_view.dart';
import '../controllers/portfilio_controller.dart';

class PortfilioView extends GetView<PortfilioController> {
  final PortfilioController controller = Get.put(PortfilioController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Portfolio', style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                      Text(
                    'Holding value',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),

                  SizedBox(height: 8),
                  Obx(() =>
                      Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹${controller.holdingValue.value.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '+${controller.holdingChangePercentage.value.toStringAsFixed(2)}%',
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),
                  SizedBox(height: 16),
                  Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Invested value',
                            style: TextStyle(color: Colors.white70),
                          ),
                          Text(
                            '₹${controller.investedValue.value.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Available INR',
                            style: TextStyle(color: Colors.white70),
                          ),
                          Text(
                            '₹${controller.availableINR.value.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
                  SizedBox(height: 16),

                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Your coins',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black12,width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Withdraw INR'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.coins.length,
              itemBuilder: (context, index) {
                final coin = controller.coins[index];
                return CryptoTile(
                  icon: coin['icon'] as IconData,
                  name: coin['name'] as String,
                  code: '${coin['amount']} ${coin['code']}',
                  price: coin['price'] as String,
                  change: coin['change'] as String,
                  isUp: coin['isUp'] as bool,
                );
              },
            )

          ),
        ],
      ),
    );
  }
}
