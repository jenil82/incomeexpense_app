import 'package:get/get.dart';

import '../../../utils/db_helper.dart';

class incomController extends GetxController {
  var selectedICategory = "Other".obs;

  RxList<String> iCategoryList = <String>[
    "Commission",
    "Salary",
    "Cash",
    "Bonus",
    "Pension",
    "Other",
  ].obs;

  var resetSelectedICategory = "Other".obs;

  void resetICategory() {
    selectedICategory.value = resetSelectedICategory.value;
  }

  var selectedIPaymentMethod = "Other".obs;

  RxList<String> iPaymentMethodList = <String>[
    "Paytm",
    "GPay",
    "Cash",
    "Phone Pe",
    "Net Banking",
    "Other",
  ].obs;

  var resetSelectedIPaymentMethod = "Other".obs;

  void resetIPaymentMethod() {
    selectedIPaymentMethod.value = resetSelectedIPaymentMethod.value;
  }

  var selectedECategory = "Other".obs;

  RxList<String> eCategoryList = <String>[
    "Grocery",
    "Medicine",
    "Vagetable",
    "Food",
    "Education",
    "Other",
  ].obs;

  var resetSelectedECategory = "Other".obs;

  void resetECategory() {
    selectedECategory.value = resetSelectedECategory.value;
  }

  var selectedEPaymentMethod = "Other".obs;

  RxList<String> ePaymentMethodList = <String>[
    "Paytm",
    "GPay",
    "Cash",
    "Phone Pe",
    "Net Banking",
    "Other",
  ].obs;

  var resetSelectedEPaymentMethod = "Other".obs;

  void resetEPaymentMethod() {
    selectedECategory.value = resetSelectedECategory.value;
  }

  var selectedCategory = "Other".obs;

  RxList<String> allCategoryList = <String>[
    "Commission",
    "Salary",
    "Cash",
    "Bonus",
    "Pension",
    "Grocery",
    "Medicine",
    "Vagetable",
    "Food",
    "Education",
    "Other",
  ].obs;

  var resetSelectedCategory = "Other".obs;

  void resetCategory() {
    selectedCategory.value = resetSelectedCategory.value;
  }

  var selectedPaymentMethod = "Other".obs;

  RxList<String> allPaymentMethodList = <String>[
    "Paytm",
    "GPay",
    "Cash",
    "Phone Pe",
    "Net Banking",
    "Other",
  ].obs;

  var resetSelectedPaymentMethod = "Other".obs;

  void resetPaymentMethod() {
    selectedPaymentMethod.value = resetSelectedPaymentMethod.value;
  }

  RxList<Map> dataList = <Map>[].obs;

  Future<void> readData() async {
    DbHelper dbHelper = DbHelper();
    dataList.value = await dbHelper.readData();
  }

  RxList<Map> categoryDataList = <Map>[].obs;

  Future<void> readCategory() async {
    DbHelper dbHelper = DbHelper();
    categoryDataList.value = await dbHelper.readCategory();
  }

  RxInt iIndex = 0.obs;

  void changeIIndex(value) {
    iIndex.value = value;
  }

  RxInt udIndex = 0.obs;

  void changeUDIndex(value) {
    udIndex.value = value;
  }

  Rx<DateTime>? dateFind = DateTime.now().obs;

  Rx<DateTime>? resetDateFind = DateTime.now().obs;

  void resetDate() {
    dateFind = resetDateFind;
  }

  Rx<DateTime>? uDateFind = DateTime.now().obs;

  Rx<DateTime>? resetUDateFind = DateTime.now().obs;

  void resetUDate() {
    uDateFind = resetDateFind;
  }

  Rx<DateTime>? filterStartingDateFind = DateTime.now().obs;

  Rx<DateTime>? resetFilterStartingDateFind = DateTime.now().obs;

  void resetFilterStartingDate() {
    filterStartingDateFind = resetFilterStartingDateFind;
  }

  Rx<DateTime>? filterEndingDateFind = DateTime.now().obs;

  Rx<DateTime>? resetFilterEndingDateFind = DateTime.now().obs;

  void resetFilterEndingDate() {
    filterEndingDateFind = resetFilterEndingDateFind;
  }

  RxList<Map> oldDataList = <Map>[].obs;

  Future<void> oldData({
    id,
  }) async {
    DbHelper dbHelper = DbHelper();
    oldDataList.value = await dbHelper.oldData(
      id: id,
    );
  }


  RxInt udId = 0.obs;

  void updateData({
    id,
    amount,
    date,
    category,
    paymentmethod,
    note,
    status,
  }) {
    DbHelper dbHelper = DbHelper();
    dbHelper.updateData(
      id: id,
      amount: amount,
      date: date,
      category: category,
      paymentmethod: paymentmethod,
      note: note,
      status: status,
    );
    readData();
  }

  void deleteData(
      int id,
      ) {
    DbHelper dbHelper = DbHelper();
    dbHelper.deleteData(
      id: id,
    );
    readData();
  }

  RxList incomeDataTotal = [].obs;

  Future<List> calculateIncomeBalance() async {
    DbHelper dbHelper = DbHelper();
    incomeDataTotal.value = await dbHelper.calculateIncomeBalance();
    return incomeDataTotal;
  }

  RxList expenseDataTotal = [].obs;

  Future<List> calculateExpenseBalance() async {
    DbHelper dbHelper = DbHelper();
    expenseDataTotal.value = await dbHelper.calculateExpenseBalance();
    return expenseDataTotal;
  }

  RxInt totalBalance = 0.obs;
  RxInt totalIncome = 0.obs;
  RxInt totalExpense = 0.obs;

  Future<RxInt> calculateTotalBalance() async {
    totalIncome.value = incomeDataTotal.value[0]['total_income'];
    totalExpense.value = expenseDataTotal.value[0]['total_expense'];
    totalBalance.value = totalIncome.value - totalExpense.value;
    return totalBalance;
  }

  RxInt zero = 0.obs;

  void filterIncomeExpense({
    required status,
  }) async {
    DbHelper dbHelper = DbHelper();
    dataList.value = await dbHelper.filterIncomeExpense(
      status: status,
    );
  }

  void filterDate({
    startingDate,
    endingDate,
  }) async {
    DbHelper dbHelper = DbHelper();
    dataList.value = await dbHelper.filterDate(
      startingDate: startingDate,
      endingDate: endingDate,
    );
  }

  void filterCategory(
      String category,
      ) async {
    DbHelper dbHelper = DbHelper();
    dataList.value = await dbHelper.filterCategory(
      category: category,
    );
  }

  void filterPaymentMethod(
      String paymentmethod,
      ) async {
    DbHelper dbHelper = DbHelper();
    dataList.value = await dbHelper.filterPaymentMethod(
      paymentmethod: paymentmethod,
    );
  }
}