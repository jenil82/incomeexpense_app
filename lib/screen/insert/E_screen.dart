import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/db_helper.dart';
import '../home/controller/controller.dart';

class i_screen extends StatefulWidget {
  const i_screen({Key? key}) : super(key: key);

  @override
  State<i_screen> createState() => _i_screenState();
}

class _i_screenState extends State<i_screen> {
  incomController homeController = Get.put(
    incomController(),
  );

  @override
  void initState() {
    super.initState();
    homeController.readData();
    homeController.resetDate();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController amountc = TextEditingController();
    TextEditingController notec = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade200,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [

                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () async {
                              homeController.dateFind!.value =
                                  await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(3000),
                                    builder: (context, child) {
                                      return Theme(
                                        data:
                                        Theme.of(context).copyWith(
                                          colorScheme:
                                          ColorScheme.light(
                                            primary: Colors.blueGrey.shade200,
                                            onPrimary: Colors.black,
                                            onSurface: Colors.blueGrey.shade200,
                                          ),
                                          textButtonTheme:
                                          TextButtonThemeData(
                                            style: TextButton.styleFrom(
                                              foregroundColor: Colors
                                                  .black, // button text color
                                            ),
                                          ),
                                        ),
                                        child: child!,
                                      );
                                    },
                                  ) ??
                                      homeController.dateFind!.value;
                            },
                            icon: Icon(
                              Icons.calendar_month,
                              color: Colors.black,
                              size: 18,
                            ),
                          ),
                          Obx(
                                () => Text(
                              "${homeController.dateFind!.value.day}/0${homeController.dateFind!.value.month}/${homeController.dateFind!.value.year}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    TextField(
                      controller: amountc,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                        ),
                        hintText: "Amount",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),SizedBox(
                  height: 2,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(height: 15,),
                        Text(
                          "Category",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    Obx(
                          () => DropdownButtonFormField(
                        value: homeController.selectedICategory.value,
                        items: homeController.iCategoryList
                            .map(
                              (element) => DropdownMenuItem(
                            child: Text(element),
                            value: element,
                          ),
                        )
                            .toList(),
                        onChanged: (value) {
                          homeController.selectedICategory.value = value!;
                        },
                        dropdownColor: Colors.white,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(height: 15,),
                        Text(
                          "Payment",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    Obx(
                          () => DropdownButtonFormField(
                        value: homeController.selectedIPaymentMethod.value,
                        items: homeController.iPaymentMethodList
                            .map(
                              (element) => DropdownMenuItem(
                            child: Text(element),
                            value: element,
                          ),
                        )
                            .toList(),
                        onChanged: (value) {
                          homeController.selectedIPaymentMethod.value =
                          value!;
                        },
                        dropdownColor: Colors.white,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(height: 15,),
                      ],
                    ),
                    TextField(
                      controller: notec,
                      cursorColor: Colors.black,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                        ),
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.note_alt_rounded,
                            color: Colors.black,
                            size: 28,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ), hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    var c = homeController.selectedICategory.value;
                    var p = homeController.selectedIPaymentMethod.value;
                    var d =
                        "${homeController.dateFind!.value.day}/0${homeController.dateFind!.value.month}/${homeController.dateFind!.value.year}";
                    var status = 0;
                    DbHelper dbHelper = DbHelper();
                    dbHelper.insertData(
                      amount: amountc.text,
                      date: d,
                      category: c,
                      paymentmethod: p,
                      note: notec.text,
                      status: status,
                    );
                    homeController.readData();
                    homeController.calculateIncomeBalance();
                    homeController.resetICategory();
                    homeController.resetDate();
                    homeController.resetIPaymentMethod();
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 25,
                      width: 90,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(2),color: Colors.black),
                      child: Text(
                        " Income",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}