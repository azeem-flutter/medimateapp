import 'package:get/get.dart';

class NavigationbarController extends GetxController {
  // Observable variables
  final currentIndex = 0.obs;
  // Method for change Index
  void chnageIndex(int index) {
    currentIndex.value = index;
  }
}
