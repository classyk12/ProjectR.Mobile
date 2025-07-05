import 'package:projectr/shared/constants.dart';
import 'package:projectr/shared/helpers/helper.dart';
import 'package:get/utils.dart';

class Validator {
  Validator._();

  static validateDefault(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  static validateLength(
      {required String? value,
      required String? errorText,
      required int length}) {
    if (value == null || value.isEmpty || value.length < length) {
      return errorText;
    }
    return null;
  }

  static validateBVN(String? value) {
    if (value == null || value.isEmpty || value.length != 11) {
      return 'Enter a valid BVN';
    }
    return null;
  }

  static validateEmail(String? value) {
    if (value == null || value.isEmpty || !value.isEmail) {
      return 'Enter a valid Email Address';
    }
    return null;
  }

  static validateCHN(String? value) {
    if (value == null || value.isEmpty || value.length > 10) {
      return 'Enter a valid CHN';
    }
    return null;
  }

  static String? validateMinAmountAndDigit(String? value) {
    var checkdigits = validateDigit(value);
    if (checkdigits != null) {
      return checkdigits;
    }
    return validateMinimumTransferAmount(value);
  }

  static String? validateDigit(String? value) {
    if (value == null ||
        value.isEmpty ||
        !value.contains(RegExp(r'(?=.*?[0-9])')) ||
        double.parse(value) < 1) {
      return 'Enter a valid value';
    }
    return null;
  }

  static String? validateMinimumTransferAmount(String? value) {
    if (double.parse(value ?? '0') < MINIMUM_TRANSFER_AMOUNT) {
      return '$value must not be less than ${AppHelper.getCurrencySymbol('NGN')}$MINIMUM_TRANSFER_AMOUNT';
    }
    return null;
  }

  static String? validateBankAccountNumber(String? value) {
    if (value == null ||
        value.isEmpty ||
        !value.contains(RegExp(r'(?=.*?[0-9])')) ||
        value.length != 10) {
      return 'Enter a valid value';
    }
    return null;
  }

  static validateDropdown(value) {
    if (value == null || value.isEmpty) {
      return 'Please select a value';
    }
    return null;
  }

  static validatephone(String value) {
    if (value.isEmpty) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  static validateObject(Object? value) {
    if (value == null) {
      return 'This field is required';
    }
    return null;
  }
}
