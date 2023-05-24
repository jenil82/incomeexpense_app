import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/controller/controller.dart';
import 'i_screen.dart';
import 'E_screen.dart';

class ITabbarScreen extends StatefulWidget {
  const ITabbarScreen({Key? key}) : super(key: key);

  @override
  State<ITabbarScreen> createState() => _ITabbarScreenState();
}

class _ITabbarScreenState extends State<ITabbarScreen> {
  incomController homeController = Get.put(
    incomController(),
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: homeController.iIndex.value,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.lightBlue,
            title: Obx(
                  () => Text(
                homeController.iIndex.value == 0
                    ? "Income"
                    : " Expense",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          backgroundColor: Colors.lightBlue,
          body: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              TabBar(
                onTap: (value) {
                  homeController.iIndex.value = value;
                },
                indicatorPadding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                labelColor: Colors.white,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
                unselectedLabelColor: Colors.black,
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.lightBlue,
                ),
                indicatorColor: Colors.black,
                tabs: [
                  SizedBox(
                    height: 60,
                    width: 160,
                    child: Tab(
                      child: Container(
                        height: 60,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text("Income"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: 160,
                    child: Tab(
                      child: Container(
                        height: 60,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text("Expense"),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    i_screen(),
                    expernsescreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}