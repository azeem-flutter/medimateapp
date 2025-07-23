import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicineReminderfieldController extends GetxController {
  //variables
  Rx<TimeOfDay?> selectedTime = Rx<TimeOfDay?>(null);
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  Rx<DateTime?> endDate = Rx<DateTime?>(null);
  Rx<DateTime?> expiryDate = Rx<DateTime?>(null);

  final timeController = TextEditingController();
  final dateController = TextEditingController();
  final endDateController = TextEditingController();
  final expiryDateController = TextEditingController();
}
