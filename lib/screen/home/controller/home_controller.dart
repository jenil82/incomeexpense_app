import 'package:get/get.dart';
import 'package:incomeexpense_app/utils/db_helper.dart';

class HomeController extends GetxController {
  RxList<String> iCategoryList = <String>[
    "Commission",
    "Salary",
    "Cash",
    "Bonus",
    "Pension",
    "Other",
  ].obs;
  var selectedICategory = "Other".obs;
  RxList<String> iPaymentMethodList = <String>[
    "Paytm",
    "GPay",
    "Cash",
    "Phone Pe",
    "Net Banking",
    "Other",
  ].obs;
  var selectedIPaymentMethod = "Other".obs;
  RxList<String> eCategoryList = <String>[
    "Grocery",
    "Medicine",
    "Vagetable",
    "Food",
    "Education",
    "Other",
  ].obs;
  var selectedECategory = "Other".obs;
  RxList<String> ePaymentMethodList = <String>[
    "Paytm",
    "GPay",
    "Cash",
    "Phone Pe",
    "Net Banking",
    "Other",
  ].obs;
  var selectedEPaymentMethod = "Other".obs;

  RxList<Map> dataList = <Map>[].obs;

  Future<void> readData() async {
    DbHelper dbHelper = DbHelper();
    dataList.value = await dbHelper.readData();
  }

  RxInt iindex = 0.obs;

  void changeIIndex(value) {
    iindex.value = value;
  }

  RxInt udindex = 0.obs;

  void changeUDIndex(value) {
    udindex.value = value;
  }

  Rx<DateTime>? dateFind = DateTime.now().obs;

  void deleteData(int id) {
    DbHelper dbHelper = DbHelper();
    dbHelper.deleteData(id: id);
    readData();
  }

  RxInt totalBalance = 0.obs;
  RxInt totalIncome = 0.obs;
  RxInt totalExpense = 0.obs;

  void balaceUpdate() {
    int i = 0;
    for (i = 0; i < dataList.length; i++) {
      int status = dataList[i]['status'];
      if (status == 0) {
        int amount = int.parse(dataList[i]['amount']);
        totalBalance.value = totalBalance.value + amount;
        totalIncome.value = totalIncome.value + amount;
      } else {
        int amount = int.parse(dataList[i]['amount']);
        totalBalance.value = totalBalance.value - amount;
        totalExpense.value = totalExpense.value + amount;
      }
    }
  }
}