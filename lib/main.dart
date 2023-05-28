import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incomeexpense_app/screen/home/view/view.dart';
import 'package:incomeexpense_app/screen/insert/E_screen.dart';
import 'package:incomeexpense_app/screen/insert/i_E_tabbar.dart';
import 'package:incomeexpense_app/screen/splah/view/screen.dart';
import 'package:incomeexpense_app/screen/transaction/filter_screen.dart';
import 'package:incomeexpense_app/screen/updatedelete/e_ubdeit.dart';
import 'package:incomeexpense_app/screen/updatedelete/i_ubdeit_screen.dart';
import 'package:incomeexpense_app/screen/updatedelete/tabbar_i_e.dart';

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
          page: () => i_screen(),
        ),
        GetPage(
          name: '/iexpense_screen',
          page: () => ITabbarScreen(),
        ),
        GetPage(
          name: '/transaction_screen',
          page: () => filter_screen(),
        ),
        GetPage(
          name: '/udtabbar_screen',
          page: () =>abbarScreen(),
        ),
        GetPage(
          name: '/udincome_screen',
          page: () => income_screen(),
        ),
        GetPage(
          name: '/udexpense_screen',
          page: () => expnsescreen(),
        ),
      ],
    ),
  );
}