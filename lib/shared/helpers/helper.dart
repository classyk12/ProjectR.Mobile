import 'package:projectr/shared/constants.dart';
import 'package:projectr/shared/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

class AppHelper {
  static String countryCodeToEmoji(String countryCode) {
    // 0x41 is Letter A
    // 0x1F1E6 is Regional Indicator Symbol Letter A
    // Example :
    // firstLetter U => 20 + 0x1F1E6
    // secondLetter S => 18 + 0x1F1E6
    // See: https://en.wikipedia.org/wiki/Regional_Indicator_Symbol
    final int firstLetter = countryCode.codeUnitAt(0) - 0x41 + 0x1F1E6;
    final int secondLetter = countryCode.codeUnitAt(1) - 0x41 + 0x1F1E6;
    return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
  }

  static String getImageFullPath(String name) {
    return 'assets/images/$name';
  }

  static Future loadConfigs(Flavor flavour) async {
    await dotenv.load();
    switch (flavour) {
      case Flavor.dev:
        break;
      default:
      // AppConfigs.baseUrl = dotenv.env['BASE_URL_PROD']!;
    }
  }

  static List<String> getRelationships() {
    return ['Father', 'Mother', 'Sibling', 'Friend'];
  }

  static String formatCurrency(dynamic x) {
    if (x == 'null') {
      return '0.00';
    }
    var s = x.toString();
    if (x == null || s.isEmpty) {
      return '0.00';
    }
    double _x = double.parse(x.toString());
    x = _x.toStringAsFixed(2);
    String formattedText = x.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
    return formattedText;
  }

  static String formatCurrencyWithFixedPoint({dynamic x, int fixedPoints = 2}) {
    if (x == 'null') {
      return '0.00';
    }
    var s = x.toString();
    if (x == null || s.isEmpty) {
      return '0.00';
    }
    double _x = double.parse(x.toString());
    x = _x.toStringAsFixed(fixedPoints);

    // Split the number into integer and decimal parts
    final parts = x.split('.');
    final integerPart = parts[0];
    final decimalPart = parts.length > 1 ? parts[1] : '00';

    // Format the integer part with commas
    final formattedInteger = integerPart.replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
    return '$formattedInteger.$decimalPart';
  }

  static String _formatNumber(String s) {
    if (s.isEmpty) return s;

    try {
      if (s == "0." || s.endsWith(".") || s == "0.00") return s;

      if (s.contains(".")) {
        final parts = s.split(".");
        final formattedWhole =
            NumberFormat("#,##0").format(double.tryParse(parts[0]) ?? 0);
        return '$formattedWhole.${parts.length > 1 ? parts[1] : ''}';
      }

      // Check if the input is a whole number
      if (int.tryParse(s) != null) {
        return NumberFormat("#,##0").format(int.parse(s)); // Format as integer
      }

      return NumberFormat("#,##0").format(double.tryParse(s) ?? 0);
    } catch (e) {
      return s;
    }
  }

  static addCommaToNumber(String value, TextEditingController _controller) {
    if (value.isEmpty) return; // Exit if the input is empty

    final cursorPosition = _controller.selection.baseOffset;

    // Remove commas to get the raw input
    final unformattedValue = value.replaceAll(",", "");

    // Format the value while preserving decimals
    final formattedValue = _formatNumber(unformattedValue);

    // Adjust cursor position to prevent jumping
    final newCursorPosition =
        cursorPosition + (formattedValue.length - value.length);

    _controller.value = TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(
        offset: newCursorPosition.clamp(0, formattedValue.length),
      ),
    );
  }

  static String formatCurrency2(dynamic x, {int? fixPlaces}) {
    var s = x.toString();
    if (x == null || s.isEmpty) {
      return '0.00';
    }
    double _x = double.parse(x.toString());
    x = _x.toStringAsFixed(fixPlaces ?? 2);

    List<String> parts = x.split('.');
    String integerPart = parts[0];
    String decimalPart = parts.length > 1 ? parts[1] : '00';

    String formattedIntegerPart = integerPart.replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');

    return '$formattedIntegerPart.$decimalPart';
  }

  static String to2dp(dynamic val) {
    if (val == null || val == '' || val == '-') {
      return '0.00';
    } else {
      return double.parse(val.toString()).toStringAsFixed(2);
    }
  }

  static setTokenHeader() {
    return {'Authorization': 'Bearer $AUTH_TOKEN'};
  }

  static DateTime formatDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  static String getCurrencySymbol(String currency) {
    String symbol = '';
    switch (currency.toUpperCase()) {
      case 'NGN':
        symbol = '₦';
        break;
      case 'USD':
        symbol = '\$';
        break;
      case 'EUR':
        symbol = '€';
        break;
      default:
        symbol = '£';
    }
    return symbol;
  }
}
