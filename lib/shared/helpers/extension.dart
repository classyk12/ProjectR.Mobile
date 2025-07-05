// ignore_for_file: unused_local_variable

import 'package:intl/intl.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

extension StringValidators on String {
  bool get hasUpperCase => contains(RegExp(r"(?=.*[A-Z])\w+"));

  bool get hasSymbolCase => !contains(RegExp(r"^[a-zA-Z0-9 ]*$"));

  bool get hasNumberCase => contains(RegExp(r'(?=.*?[0-9])'));

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.capitalize())
      .join(' ');

  MediaType getMediaType() {
    String? mime = lookupMimeType(this);

    if (mime != null) {
      String type = mime.split('/').first;
      String subtype = mime.split('/').last;
      return MediaType(type, subtype);
    }

    return MediaType('image', 'jpeg');
  }
}

extension DateConverters on DateTime {
  String get formatDateYYMMDD {
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(this);
  }

  String get formatDateYYMMDD2 {
    DateFormat formatter = DateFormat('dd/MM/yy');
    return formatter.format(this);
  }

  String get formatDateDMMMYYYY {
    DateFormat formatter = DateFormat('d MMM yyyy');
    return formatter.format(this);
  }
}
