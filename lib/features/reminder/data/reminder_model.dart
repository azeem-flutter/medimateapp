import 'package:get/get.dart';

class ReminderModel {
  final String medicineName;
  final String time;
  RxBool isEnalbed;

  ReminderModel({
    required this.medicineName,
    required this.time,
    required bool isEnalbed,
  }) : isEnalbed = isEnalbed.obs;
}
