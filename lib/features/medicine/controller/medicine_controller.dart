import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MedicineScreenController extends GetxController {
  final TextEditingController searchController = TextEditingController();

  final RxList<Map<String, dynamic>> allMedicines =
      <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> filteredMedicines =
      <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();

    //Sample dummy data
    allMedicines.assignAll([
      {
        "name": "Paracetamol 500mg",
        "timing": "3x a day (Morning, Noon, Night)",
        "stock": 6,
        "expiry": "20 Sep 2025",
      },
      {
        "name": "Ibuprofen",
        "timing": "2x a day (Morning, Night)",
        "stock": 2,
        "expiry": "05 Aug 2025",
      },
      {
        "name": "Vitamin D",
        "timing": "Once Daily",
        "stock": 0,
        "expiry": "01 Jul 2024",
      },
    ]);

    // assign it to the filter Medicies
    filteredMedicines.assignAll(allMedicines);
    searchController.addListener(() {
      final query = searchController.text.toLowerCase();
      if (query.isEmpty) {
        filteredMedicines.assignAll(allMedicines);
      } else {
        filteredMedicines.assignAll(
          allMedicines.where(
            (medicine) => medicine['name'].toLowerCase().contains(query),
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
