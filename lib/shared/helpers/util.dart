import 'dart:developer';

import 'package:projectr/shared/configs/app_configs.dart';
import 'package:projectr/shared/constants.dart';
import 'package:projectr/shared/enums.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

customDebugPrint({required dynamic message, String? key = 'Payload'}) {
  const String blue = '\x1B[34m';
  if (kDebugMode) log("$blue$key ==> ${message.toString()}");
}

String getNameFirstLetter(String string) {
  var split = string.characters;
  var first = split.first.toUpperCase();
  return first;
}

void switchTheme({BuildContext? context, WidgetRef? ref}) {
  AppThemeMode newMode = CURRENT_APP_THEME_MODE == AppThemeMode.dark
      ? AppThemeMode.light
      : AppThemeMode.dark;
  //ref?.read(themeProvider.notifier).switchThemeMode(newMode);
}

// void resetConstants() {
//   ACCOUNT_CREATION_MODEL = SignUpModel();
//   USER_DATA = LoginUser.initial();
//   AUTH_TOKEN = '';
//   SELECTED_INVESTMENT_PATH = '';
//   INVESTMENT_ACCOUNTS = <InvestmentAccountModel>[];
//   EQUITIES_LIST = <Equities>[];
//   EMBASSIES_LIST = <EmbassyModel>[];
//   MY_MUTUAL_FUNDS_LIST = <MutualFundAccountModel>[];
//   MY_BANK_ACCOUNTS = <BankAccountModel>[];
//   COUNTRIES_LIST = <CountryModel>[];
//   RELATIONSHIP_LIST = <RelationShipModel>[];
//   PRODUCT_TYPES = <String, dynamic>{};

//   ///This flag indicates if a new update of the product type should be gotten from the api irrespecitive if a cache value exist before
//   getProductTypeByForce = true;
//   shouldReadFromCache = true;
// }

launchbrowser({String? urlString}) async {
  var baseUrl = AppConfigs.websiteUrl;
  String url = urlString ?? baseUrl;
  debugPrint(url.toString());
  var url1 = Uri.parse(url);
  var urllaunchable = await canLaunchUrl(url1);
  customDebugPrint(message: urllaunchable);
  if (urllaunchable) {
    await launchUrl(url1, mode: LaunchMode.externalApplication);
  } else {
    customDebugPrint(message: "URL can't be launched.");
  }
}

void launchEmail({String? path}) async {
  final Uri mailToUri = Uri(
    scheme: 'mailto',
    path: path ?? 'csalpha@cardinalstone.com',
  );
  var urlString = mailToUri.toString();
  if (await canLaunchUrlString(urlString)) {
    await launchUrlString(urlString);
  } else {
    customDebugPrint(message: 'Could not launch $mailToUri');
  }
}

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key, required this.ref});

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // AppThemeMode newMode = CURRENT_APP_THEME_MODE == AppThemeMode.dark
        //     ? AppThemeMode.light
        //     : AppThemeMode.dark;
        // ref.read(themeProvider.notifier).switchThemeMode(newMode);
      },
      child: const Text('SWITCH MODE'),
    );
  }
}
