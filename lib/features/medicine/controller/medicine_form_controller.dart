import 'package:get/get.dart';

class MedicineFormController extends GetxController {
  //Variables
  final RxString selectedType = ''.obs;
  final RxString selectedUnits = ''.obs;

  //List,
  final List<String> medicineTypes = [
    'Tablet',
    'Syrup',
    'Capsule',
    'Injection',
    'Drops',
  ];

  //List
  final List<String> stockUnitstypes = ['mg', 'ml', 'mm', 'lg'];
}
