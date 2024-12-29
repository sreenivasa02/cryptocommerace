import 'package:flutter/material.dart';

class DataList{
 static  List<Map<String, dynamic>> dataList= [
  {
  'icon': Icons.currency_bitcoin,
  'name': 'Bitcoin',
  'code': 'BTC',
    'amount': '18.698',
  'price': '₹2,509.75',
  'change': '+9.77%',
  'isUp': true,
  },
  {
  'icon': Icons.token,
  'name': 'Ethereum',
  'code': 'ETH',
    'amount': '17.698',
  'price': '₹2,509.75',
  'change': '-21.00%',
  'isUp': false,
  },
  {
  'icon': Icons.dashboard,
  'name': 'Band Protocol',
  'code': 'BAND',
    'amount': '14.898',
  'price': '₹553.06',
  'change': '-22.97%',
  'isUp': false,
  },
  {
  'icon': Icons.circle,
  'name': 'Cardano',
  'code': 'ADA',
  'price': '₹105.06',
    'amount': '13.698',
  'change': '+16.31%',
  'isUp': true,
  },
  {
  'icon': Icons.trending_down,
  'name': 'TRON',
  'code': 'TRX',
  'price': '₹5.29',
    'amount': '15.658',
  'change': '-16.58%',
  'isUp': false,
  },
  {
  'icon': Icons.attach_money,
  'name': 'Tether',
  'code': 'USDT',
  'price': '₹73.00',
    'amount': '12.938',
  'change': '+0.07%',
  'isUp': true,
  },
  {
  'icon': Icons.pets,
  'name': 'Dogecoin',
  'code': 'DOGE',
  'price': '₹23.39',
    'amount': '18.698',
  'change': '-1.67%',
  'isUp': false,
  },
  ];
}