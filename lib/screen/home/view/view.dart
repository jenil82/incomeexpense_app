import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  incomController homeController = Get.put(
    incomController(),
  );

  @override
  void initState() {
    super.initState();
    homeController.readData();
    homeController.calculateIncomeBalance();
    homeController.calculateExpenseBalance();
    // homeController.calculateTotalBalance();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          onPressed: () {
                            Get.toNamed('transaction_screen');
                          },
                          icon: Icon(Icons.history),
                          color: Colors.white,
                          iconSize: 30,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 15,
                                top: 20,
                                bottom: 25,
                                right: 10,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 25,
                                  bottom: 25,
                                  left: 15,
                                  right: 15,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Income",
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 19,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 4,
                                      ),
                                      child: Obx(
                                            () => homeController
                                            .incomeDataTotal.isEmpty
                                            ? Text(
                                          "₹ ${homeController.zero.value}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                            : Text(
                                          "₹ ${homeController.incomeDataTotal.value[0]['total_income']}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          homeController.changeIIndex(0);
                                          Get.toNamed(
                                            'itabbar_screen',
                                          );
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            "+ Income",
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: 15,
                                top: 20,
                                bottom: 25,
                                left: 10,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 25,
                                  bottom: 25,
                                  left: 15,
                                  right: 15,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Expense",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 4,
                                      ),
                                      child: Obx(
                                            () => homeController
                                            .expenseDataTotal.isEmpty
                                            ? Text(
                                          "₹ ${homeController.zero.value}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight:
                                            FontWeight.bold,
                                          ),
                                        )
                                            : Text(
                                          "₹ ${homeController.expenseDataTotal.value[0]['total_expense']} ",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight:
                                            FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          homeController.changeIIndex(1);
                                          Get.toNamed(
                                            'itabbar_screen',
                                          );
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(2),
                                          child: Text(
                                            "- Expense",
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: Obx(
                      () => ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: 15,
                          right: 15,
                          top: 5,
                          bottom: 5,
                        ),
                        child: InkWell(
                          onTap: () {
                            homeController.udId.value =
                            homeController.dataList[index]['id'];
                            homeController.changeUDIndex(
                                homeController.dataList[index]['status']);
                            homeController.oldData(
                              id: homeController.udId.value,
                            );
                            Get.toNamed(
                              'udtabbar_screen',
                              arguments: index,
                            );
                          },
                          child: Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Container(
                                    height: double.infinity,
                                    width: 40,
                                    alignment: Alignment.center,
                                    child: homeController.dataList[index]
                                    ['status'] ==
                                        1
                                        ? Icon(
                                      Icons.import_export,
                                      color: Colors.red,
                                      size: 35,
                                    )
                                        : Icon(
                                      Icons.import_export,
                                      color: Colors.green,
                                      size: 35,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${homeController.dataList.value[index]['category']}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${homeController.dataList.value[index]['paymentmethod']}",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "${homeController.dataList.value[index]['date']}",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 15),
                                      child: Container(
                                        height: double.infinity,
                                        width: double.infinity,
                                        alignment: Alignment.topRight,
                                        child: homeController.dataList[index]
                                        ['status'] ==
                                            1
                                            ? Text(
                                          "₹ ${homeController.dataList.value[index]['amount']} INR",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        )
                                            : Text(
                                          "₹ ${homeController.dataList.value[index]['amount']} INR",
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: homeController.dataList.length,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}