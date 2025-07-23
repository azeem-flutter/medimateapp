import 'package:intl/intl.dart';

class MFormatter {
  // Format Date (e.g. 12-Mar-2025)
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date); // Customize as needed
  }

  // Format Currency (e.g. $1,000.00)
  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  // Format Phone Number
  static String formatPhoneNumber(String phoneNumber) {
    // Example for 10-digit US number format: (123) 456-7890
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '${phoneNumber.substring(0, 4)} ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}';
    }

    // Return original if format not recognized
    return phoneNumber;
  }
}
