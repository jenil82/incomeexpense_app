import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/controller/controller.dart';
import 'i_ubdeit_screen.dart';
import 'e_ubdeit.dart';

class abbarScreen extends StatefulWidget {
  const abbarScreen({Key? key}) : super(key: key);

  @override
  State<abbarScreen> createState() => _abbarScreenState();
}

class _abbarScreenState extends State<abbarScreen> {
  incomController homeController = Get.put(
    incomController(),
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: homeController.udIndex.value,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Obx(
                  () => Text(
                homeController.udIndex.value == 0
                    ? " Income"
                    : " Expense",
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
                    homeController.deleteData(
                      homeController.udId.value,
                    );
                    homeController.calculateIncomeBalance();
                    homeController.calculateExpenseBalance();
                    // homeController.calculateTotalBalance();
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
                onTap: (value) {
                  homeController.udIndex.value = value;
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
                    income_screen(),
                    expnsescreen(),
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