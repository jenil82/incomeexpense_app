import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/db_helper.dart';
import '../home/controller/controller.dart';

class expnsescreen extends StatefulWidget {
  const expnsescreen({Key? key}) : super(key: key);

  @override
  State<expnsescreen> createState() => _expnsescreenState();
}

class _expnsescreenState extends State<expnsescreen> {
  incomController homeController = Get.put(
    incomController(),
  );

  @override
  void initState() {
    super.initState();
    homeController.readData();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController amountc = TextEditingController(
      text: "${homeController.oldDataList.value[0]['amount']}",
    );
    TextEditingController notec = TextEditingController(
      text: "${homeController.oldDataList.value[0]['note']}",
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            " Date",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 61,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
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
                                              primary: Colors.black,
                                              onPrimary: Colors.white,
                                              onSurface: Colors.black,
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
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            Obx(
                                  () => Text(
                                "${homeController.oldDataList.value[0]['date']}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Amount",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
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
                            borderRadius: BorderRadius.circular(0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Category",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(
                            () => DropdownButtonFormField(
                          value: homeController.selectedECategory.value,
                          items: homeController.eCategoryList
                              .map(
                                (element) => DropdownMenuItem(
                              child: Text(element),
                              value: element,
                            ),
                          )
                              .toList(),
                          onChanged: (value) {
                            homeController.selectedECategory.value = value!;
                          },
                          dropdownColor: Colors.cyan,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Payment",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(
                            () => DropdownButtonFormField(
                          value: homeController.selectedEPaymentMethod.value,
                          items: homeController.ePaymentMethodList
                              .map(
                                (element) => DropdownMenuItem(
                              child: Text(element),
                              value: element,
                            ),
                          )
                              .toList(),
                          onChanged: (value) {
                            homeController.selectedEPaymentMethod.value =
                            value!;
                          },

                          dropdownColor: Colors.grey.shade300,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Note",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: notec,
                        cursorColor: Colors.black,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.description,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    var c = homeController.selectedECategory.value;
                    var p = homeController.selectedEPaymentMethod.value;
                    var d =
                        "${homeController.dateFind!.value.day}/0${homeController.dateFind!.value.month}/${homeController.dateFind!.value.year}";
                    var status = 1;
                    DbHelper dbHelper = DbHelper();
                    dbHelper.updateData(
                      amount: amountc.text,
                      date: d,
                      category: c,
                      paymentmethod: p,
                      note: notec.text,
                      status: status,
                      id: homeController.udId.value,
                    );
                    homeController.readData();
                    homeController.calculateExpenseBalance();
                    // homeController.calculateTotalBalance();
                    homeController.resetECategory();
                    homeController.resetEPaymentMethod();
                    Get.back();
                  },
                  child: Text(
                    "Update",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
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