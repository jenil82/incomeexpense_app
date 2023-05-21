import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/controller/home_controller.dart';
import 'udexpense_screen.dart';
import 'udincome_screen.dart';

class UDTabbarScreen extends StatefulWidget {
  const UDTabbarScreen({Key? key}) : super(key: key);

  @override
  State<UDTabbarScreen> createState() => _UDTabbarScreenState();
}

class _UDTabbarScreenState extends State<UDTabbarScreen> {
  HomeController homeController = Get.put(
    HomeController(),
  );

  @override
  Widget build(BuildContext context) {
    var index = Get.arguments;
    return DefaultTabController(
      length: 2,
      initialIndex: homeController.udindex.value,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Obx(
                  () => Text(
                homeController.udindex.value == 0
                    ? "Update Income"
                    : "Update Expense",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 18),
                child: InkWell(
                  onTap: () {
                    var id = homeController.dataList[index]['id'];
                    homeController.deleteData(id);
                    Get.back();
                  },
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              TabBar(
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
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black,
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
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.black,
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
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.black,
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
                    UDIncomeScreen(),
                    UDExpenseScreen(),
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