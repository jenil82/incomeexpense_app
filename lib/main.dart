import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incomeexpense_app/screen/home/view/view.dart';
import 'package:incomeexpense_app/screen/insert/i_screen.dart';
import 'package:incomeexpense_app/screen/insert/E_screen.dart';
import 'package:incomeexpense_app/screen/insert/i_E_tabbar.dart';
import 'package:incomeexpense_app/screen/splah/view/screen.dart';
import 'package:incomeexpense_app/screen/transaction/filter_screen.dart';
import 'package:incomeexpense_app/screen/updatedelete/i_ubdeit_screen.dart';
import 'package:incomeexpense_app/screen/updatedelete/e_ubdeit.dart';
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
          name: '/a',
          page: () => HomeScreen(),
        ),
        GetPage(
          name: '/b',
          page: () => ITabbarScreen(),
        ),
        GetPage(
          name: '/c',
          page: () => i_screen(),
        ),
        GetPage(
          name: '/d',
          page: () => expernsescreen(),
        ),
        GetPage(
          name: '/e',
          page: () => filter_screen(),
        ),
        GetPage(
          name: '/f',
          page: () => abbarScreen(),
        ),
        GetPage(
          name: '/d',
          page: () => income_screen(),
        ),
        GetPage(
          name: '/h',
          page: () => expernsescreen(),
        ),
      ],
    ),
  );
}
