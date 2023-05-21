import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incomeexpense_app/screen/home/view/view.dart';
import 'package:incomeexpense_app/screen/insert/iexpense_screen.dart';
import 'package:incomeexpense_app/screen/insert/iincome_screen.dart';
import 'package:incomeexpense_app/screen/insert/itabbar_screen.dart';
import 'package:incomeexpense_app/screen/splah/view/splash_screen.dart';
import 'package:incomeexpense_app/screen/transaction/transaction_screen.dart';
import 'package:incomeexpense_app/screen/updatedelete/udexpense_screen.dart';
import 'package:incomeexpense_app/screen/updatedelete/udincome_screen.dart';
import 'package:incomeexpense_app/screen/updatedelete/udtabbar_screen.dart';


void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => SplashScreen(),
        ),
        GetPage(
          name: '/home_screen',
          page: () => HomeScreen(),
        ),
        GetPage(
          name: '/itabbar_screen',
          page: () => ITabbarScreen(),
        ),
        GetPage(
          name: '/iincome_screen',
          page: () => IIncomeScreen(),
        ),
        GetPage(
          name: '/iexpense_screen',
          page: () => IExpenseScreen(),
        ),
        GetPage(
          name: '/transaction_screen',
          page: () => TransactionScreen(),
        ),
        GetPage(
          name: '/udtabbar_screen',
          page: () => UDTabbarScreen(),
        ),
        GetPage(
          name: '/udincome_screen',
          page: () => UDIncomeScreen(),
        ),
        GetPage(
          name: '/udexpense_screen',
          page: () => UDExpenseScreen(),
        ),
      ],
    ),
  );
}