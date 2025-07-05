import 'package:projectr/shared/configs/app_configs.dart';
import 'package:projectr/shared/constants.dart';
import 'package:projectr/shared/enums.dart';
import 'package:projectr/shared/themes/app_colors.dart';
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
        AppConfigs.baseUrl = dotenv.env['BASE_URL_TEST']!;
        AppConfigs.otherBaseUrl = dotenv.env['OTHER_BASE_URL_TEST']!;
        AppConfigs.encryptionKey = dotenv.env['ENCRYPTION_KEY_TEST']!;
        AppConfigs.eventsBaseUrl = dotenv.env['EVENT_BASE_URL_TEST']!;
        AppConfigs.paymentCallBackURL =
            dotenv.env['PAYMENT_CALLBACK_URL_TEST']!;
        AppConfigs.pdfGeneratorBaseUrl = dotenv.env['PDF_GENERATOR_URL_TEST']!;
        AppConfigs.kycBeBaseUrl = dotenv.env['KYC_BE_URL_TEST']!;
        AppConfigs.mutualFundSubscriptionCallBackURL =
            dotenv.env['MUTUAL_FUNDS_SUBSCRIPTION_CALLBACK_URL_TEST']!;
        AppConfigs.socketUrl = dotenv.env['SOCKET_URL_TEST']!;
        AppConfigs.websiteUrl = dotenv.env['WEBSITE_BASE_URL_TEST']!;
        AppConfigs.termdsAndConditionsUrl =
            dotenv.env['TERMS_AND_CONDITIONS_URL']!;
        AppConfigs.privacyPolicyUrl = dotenv.env['PRIVACY_POLICY_URL']!;
        AppConfigs.payload_enc_key = dotenv.env['PAYLOAD_ENCRYPTION_PASSWORD']!;
        AppConfigs.payload_enc_secret =
            dotenv.env['PAYLOAD_ENCRYPTION_SECRET']!;

        break;
      default:
        AppConfigs.baseUrl = dotenv.env['BASE_URL_PROD']!;
        AppConfigs.otherBaseUrl = dotenv.env['OTHER_BASE_URL_PROD']!;
        AppConfigs.encryptionKey = dotenv.env['ENCRYPTION_KEY_PROD']!;
        AppConfigs.eventsBaseUrl = dotenv.env['EVENT_BASE_URL_TEST']!;
        AppConfigs.socketUrl = dotenv.env['SOCKET_URL_PROD']!;
        AppConfigs.paymentCallBackURL =
            dotenv.env['PAYMENT_CALLBACK_URL_PROD']!;
        AppConfigs.pdfGeneratorBaseUrl = dotenv.env['PDF_GENERATOR_URL_PROD']!;
        AppConfigs.kycBeBaseUrl = dotenv.env['KYC_BE_URL_PROD']!;
        AppConfigs.mutualFundSubscriptionCallBackURL =
            dotenv.env['MUTUAL_FUNDS_SUBSCRIPTION_CALLBACK_URL_PROD']!;
        AppConfigs.websiteUrl = dotenv.env['WEBSITE_BASE_URL_PROD']!;
        AppConfigs.termdsAndConditionsUrl =
            dotenv.env['TERMS_AND_CONDITIONS_URL']!;
        AppConfigs.privacyPolicyUrl = dotenv.env['PRIVACY_POLICY_URL']!;
        AppConfigs.payload_enc_key = dotenv.env['PAYLOAD_ENCRYPTION_PASSWORD']!;
        AppConfigs.payload_enc_secret =
            dotenv.env['PAYLOAD_ENCRYPTION_SECRET']!;
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

  static dynamic colorSelector({required int index}) {
    var colors = <Color>[
      const Color(0xFF002564),
      const Color(0xFF049DD9),
      const Color(0xffE61C23),
      const Color(0xffF19920),
      Colors.brown,
      Colors.teal,
      const Color(0xFFcbc526),
      Colors.purple,
      Colors.black,
      const Color(0xFF085776),
      Colors.limeAccent,
      Colors.white70,
      Colors.yellowAccent,
      Colors.black12,
      Colors.blueGrey,
      Colors.lightGreen,
      const Color(0xff002251),
      const Color(0xffF19920),
      const Color(0xFF528DC2),
      Colors.pink,
      Colors.purpleAccent,
      Colors.blue.withOpacity(0.5),
      Colors.indigoAccent,
      Colors.red.withOpacity(0.3),
      Colors.yellow.shade400
    ];
    if (index < 26) {
      var item = colors[index];
      if (item == null) {
        return AppColors.lightGrey;
      }
      return item;
    }
    return Colors.grey;
  }

  ///Use this to map asset type when validating and submitting order requests.
  static String assetTypeMapper(String assetType) {
    switch (assetType.toUpperCase()) {
      case 'EQTY':
        return 'EQUITY';
      default:
        return assetType;
    }
  }

  ///Use this to map types during fund transfers.
  static String typeMapperForWalletTransfer(String type) {
    if (type.toLowerCase().contains('securities')) {
      return 'SEC_ACCOUNT';
    } else if (type.toLowerCase().contains('wallet')) {
      return 'WALLET';
    } else if (type.toLowerCase().contains('fixed income')) {
      return 'FIXED_DEPOSIT';
    } else {
      return 'BANK';
    }
  }

  ///Use this to map types during fund transfers.
  static String typeMapper(String type) {
    if (type.toLowerCase().contains('securities')) {
      return 'SEC_ACCOUNT';
    } else if (type.toLowerCase().contains('wallet')) {
      return 'NGN Wallet';
    } else if (type.toLowerCase().contains('fixed income')) {
      return 'FIXED_DEPOSIT';
    } else {
      return 'BANK';
    }
  }

  static String businessTransferTypeMapper(String type) {
    if (type.toLowerCase().contains('securities')) {
      return 'SEC_ACCOUNT';
    } else if (type.toLowerCase().contains('wallet')) {
      return 'WALLET';
    } else if (type.toLowerCase().contains('fixed income')) {
      return 'FIXED_DEPOSIT';
    } else {
      return 'BANK';
    }
  }

  //use this to map destination types during wallet subscription
  static String mutualFundSubscriptionTypeMapper(String type) {
    if (type.toLowerCase().contains('money market fund')) {
      return 'MONEY_MARKET_FUND';
    } else if (type.toLowerCase().contains('alpha fund')) {
      return 'ALPHA_FUND';
    } else if (type.toLowerCase().contains('equity fund')) {
      return 'EQUITY_FUND';
    } else {
      return 'FUND';
    }
  }

  ///Use this to map product types during mutual fund subscription
  static String getProductType(String fundDescription) {
    if (fundDescription.toLowerCase().contains('alpha fund')) {
      return 'Alpha Fund';
    } else if (fundDescription.toLowerCase().contains('equity fund')) {
      return 'Equity Fund';
    } else if (fundDescription.toLowerCase().contains('money market fund')) {
      return 'MMF Fund';
    } else {
      return 'CSOF Fund';
    }
  }

  ///Use this to map fund descriptions to short name
  static String getFundShortName(String fundDescription) {
    if (fundDescription.toLowerCase().contains('alpha fund')) {
      return 'Alpha Fund';
    } else if (fundDescription.toLowerCase().contains('equity fund')) {
      return 'Equity Fund';
    } else if (fundDescription.toLowerCase().contains('money market fund')) {
      return 'Money Market Fund';
    } else if (fundDescription.toLowerCase().contains('balanced fund')) {
      return 'Balanced Fund';
    } else if (fundDescription.toLowerCase().contains('dollar fund')) {
      return 'Dollar Fund';
    } else {
      return 'CSOF Fund';
    }
  }

  static DateTime formatDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  static String getFriendlyNameForCurrency(String currency) {
    switch (currency.toUpperCase()) {
      case 'NGN':
        return 'Nigeria Naira (${AppHelper.getCurrencySymbol(currency)})';
      default:
        return 'United State Dollars (${AppHelper.getCurrencySymbol(currency)})';
    }
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

  static String getIdentityType(String docType) {
    String symbol = '';
    switch (docType.toLowerCase()) {
      case 'international passport':
        symbol = 'Passport';
        break;
      case 'voters card':
        symbol = 'Voters Card';
        break;
      case 'drivers license':
        symbol = 'Drivers License';
        break;
      default:
        symbol = 'NIN';
    }
    return symbol;
  }

  static String getIdentityTypeForSignup(String docType) {
    String symbol = '';
    switch (docType.toLowerCase()) {
      case 'international passport':
        symbol = 'International Passport';
        break;
      case 'voters card':
        symbol = 'National Voters Card';
        break;
      case 'drivers license':
        symbol = 'National Drivers License';
        break;
      default:
        symbol = 'National Identification Number';
    }
    return symbol;
  }

  static String getMutualFundPDFPath(
      {required String name, required MutualFundDocType type}) {
    String path = '';
    switch (type) {
      case MutualFundDocType.deed:
        if (name.toLowerCase().contains('alpha')) {
          path = '';
        } else if (name.toLowerCase().contains('equity')) {
          path = EQUITY_FUND_TRUST_DEED_FILE_PATH;
        } else if (name.toLowerCase().contains('money market')) {
          path = MONEY_MARKET_FUND_TRUST_TRUST_DEED_FILE_PATH;
        } else if (name.toLowerCase().contains('fixed income')) {
          path = FIXED_INCOME_FUND_TRUST_DEED_FILE_PATH;
        } else if (name.toLowerCase().contains('dollar')) {
          path = DOLLAR_FUND_TRUST_DEED_FILE_PATH;
        }

      case MutualFundDocType.prospectus:
        if (name.toLowerCase().contains('alpha')) {
          path = '';
        } else if (name.toLowerCase().contains('equity')) {
          path = EQUITY_FUND_TRUST_PROSPECTUS_FILE_PATH;
        } else if (name.toLowerCase().contains('money market')) {
          path = MONEY_MARKET_FUND_PROSPECTUS_FILE_PATH;
        } else if (name.toLowerCase().contains('fixed income')) {
          path = FIXED_INCOME_FUND_PROSPECTUS_FILE_PATH;
        } else if (name.toLowerCase().contains('dollar')) {
          path = DOLLAR_FUND_TRUST_PROSPECTUS_FILE_PATH;
        }
    }
    return path;
  }
}
