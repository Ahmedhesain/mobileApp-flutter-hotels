
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomSearchFilterHotelPageController extends GetxController {


  // final int id = Get.arguments;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<DateTime> selectedDatetwo = DateTime.now().obs;
  final RxInt children=0.obs;
  final RxInt adults=0.obs;
  var searchController = TextEditingController();

  selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate.value)
      selectedDate.value = selected;
  }
  selectEndDate(BuildContext context) async {
    final DateTime? selectedEnd = await showDatePicker(
      context: context,
      initialDate: selectedDatetwo.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (selectedEnd != null && selectedEnd != selectedDatetwo.value)
      selectedDatetwo.value = selectedEnd;
  }



  @override
  void onInit() {
    super.onInit();


  }



}
