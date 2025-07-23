import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medimate_app/features/reminder/data/reminder_model.dart';

class ReminderSearchandListController extends GetxController {
  final TextEditingController searchController = TextEditingController();

  // All reminders (dummy or fetched from DB)
  final RxList<ReminderModel> allReminders = <ReminderModel>[].obs;

  // Search filtered reminders
  final RxList<ReminderModel> filteredReminders = <ReminderModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    // Sample dummy data
    allReminders.assignAll([
      ReminderModel(
        medicineName: 'Paracetamol',
        time: '8:00 AM',
        isEnalbed: true,
      ),
      ReminderModel(
        medicineName: 'Vitamin D',
        time: '2:00 PM',
        isEnalbed: false,
      ),
      ReminderModel(
        medicineName: 'Ibuprofen',
        time: '6:00 PM',
        isEnalbed: false,
      ),
    ]);

    // Initially show all
    filteredReminders.assignAll(allReminders);

    // Add listener for search
    searchController.addListener(() {
      final query = searchController.text.toLowerCase();
      if (query.isEmpty) {
        filteredReminders.assignAll(allReminders);
      } else {
        filteredReminders.assignAll(
          allReminders.where(
            (reminder) => reminder.medicineName.toLowerCase().contains(query),
          ),
        );
      }
    });
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
