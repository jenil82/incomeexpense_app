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
                        Text(
                          " Date",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
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
                      ],
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
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
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
                      ],
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
                        dropdownColor: Colors.black,
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
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
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
                      ],
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
                        dropdownColor: Colors.black,
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
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Text(
                      "Note",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
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
                  height: 25,
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
                    homeController.resetECategory();
                    homeController.resetEPaymentMethod();
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 25,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Text(
                        "Update",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
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
  }
}