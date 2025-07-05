import 'package:projectr/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

customDatePicker(BuildContext? context, TextEditingController controller,
    {TextEditingController? startDate,
    required DateFormat dateFormat,
    required DateTime initialDate,
    required DateTime earliestAllowedDate,
    required DateTime latestAllowedDate,
    DateTime? currentDate,
    bool formatDate = true}) async {
  final format = DateFormat(DATE_FORMATTER_YEAR_FIRST);

  DateTime? dateTimePicker = await showDatePicker(
    //TODO: adapt background color to theme
    context: context!,
    initialDate:
        DateFormat(DATE_FORMATTER_YEAR_FIRST).parse(format.format(initialDate)),
    firstDate: DateFormat(DATE_FORMATTER_YEAR_FIRST)
        .parse(format.format(earliestAllowedDate)),
    lastDate: DateFormat(DATE_FORMATTER_YEAR_FIRST)
        .parse(format.format(latestAllowedDate)),
    currentDate: currentDate ?? DateTime.now(),
  );

  if (dateTimePicker != null) {
    if (formatDate) {
      controller.text = dateFormat.format(dateTimePicker);
      return controller.text;
    }
    return dateTimePicker;
  }
}

customSelectableDatePicker(
    BuildContext? context, TextEditingController controller,
    {bool isEndDate = false,
    TextEditingController? startDate,
    required DateFormat dateFormat,
    bool isLastDate = false,
    bool isEndDateSelectable = false,
    required int noOfYears,
    bool isDaySelectable = false,
    required int selectedDayOrDate,
    required bool isDayOfTheWeekSelected}) async {
  final format = DateFormat(DATE_FORMATTER_YEAR_FIRST);

  DateTime dateTime = DateTime.now();

  int daysToAdd(int todayIndex, int targetIndex) {
    if (todayIndex < targetIndex) {
      // jump to target day in same week
      return targetIndex - todayIndex;
    } else if (todayIndex >= targetIndex) {
      // must jump to next week
      return isDayOfTheWeekSelected
          ? 7 + targetIndex - todayIndex
          : isEndDateSelectable
              ? CustomCalendar.monthDays[DateFormat(DATE_FORMATTER_YEAR_FIRST)
                          .parse(startDate?.text ?? format.format(dateTime))
                          .month +
                      1] -
                  (todayIndex - targetIndex)
              : CustomCalendar.monthDays[DateTime.now().month - 1] -
                  (todayIndex - targetIndex); // targetIndex - todayIndex;
    } else {
      return 0; // date is matched
    }
  }

  DateTime defineInitialDate() {
    DateTime now = DateTime.now();
    int dayOffset = isDayOfTheWeekSelected
        ? daysToAdd(now.weekday, selectedDayOrDate)
        : daysToAdd(now.day, selectedDayOrDate);
    // int dayOffset = daysToAdd(now.weekday, selectedDayOrDate);
    return isEndDateSelectable
        ? DateFormat(DATE_FORMATTER_YEAR_FIRST)
            .parse(startDate?.text ?? format.format(dateTime))
        : now.add(Duration(days: dayOffset));
  }

  bool defineSelectable(DateTime val) {
    DateTime now = DateTime.now();

    if (val.isBefore(now)) {
      return false;
    }

    if (isDayOfTheWeekSelected
        ? val.weekday == selectedDayOrDate
        : val.day == selectedDayOrDate) {
      return true;
    } else {
      return false;
    }
  }

  DateTime? dateTimePicker = await showDatePicker(
    context: context!,
    firstDate: isLastDate
        ? DateFormat(DATE_FORMATTER_YEAR_FIRST)
            .parse(format.format(DateTime(DateTime.now().year - 100)))
        : isEndDate
            ? DateFormat(DATE_FORMATTER_YEAR_FIRST)
                .parse(startDate?.text ?? format.format(dateTime))
            : dateTime.subtract(const Duration(days: 365000)),
    lastDate: isLastDate
        ? DateFormat(DATE_FORMATTER_YEAR_FIRST)
            .parse(format.format(DateTime(DateTime.now().year - noOfYears)))
        : dateTime.add(const Duration(days: 365000)),
    initialDate: defineInitialDate(),
    selectableDayPredicate: defineSelectable,
  );

  controller.text = dateFormat.format(dateTimePicker!);

  return controller.text;
}

Future<List<TextEditingController>> customDateRangePicker(
    BuildContext context, List<TextEditingController> controller, bool isStart,
    {bool isEndDate = false,
    TextEditingController? startDate,
    DateFormat? dateFormat}) async {
  final format = DateFormat(DATE_FORMATTER_YEAR_FIRST);

  DateTime dateTime = DateTime.now();

  DateTimeRange? dateTimePicker = await showDateRangePicker(
    context: context,
    firstDate: isEndDate
        ? DateFormat(DATE_FORMATTER_YEAR_FIRST).parse(startDate!.text)
        : dateTime.subtract(const Duration(minutes: 365000)),
    lastDate: DateTime.now(),
    currentDate: DateTime.now(),
  );

  controller[0].text = dateFormat != null
      ? dateFormat.format(dateTimePicker!.start)
      : format.format(dateTimePicker!.start);

  controller[1].text = dateFormat != null
      ? dateFormat.format(dateTimePicker.end)
      : format.format(dateTimePicker.end);

  return controller;
}

String showCupertinoDatePicker(
    BuildContext context, TextEditingController controller,
    {bool isEndDate = false,
    TextEditingController? startDate,
    required DateFormat dateFormat,
    bool isLastDate = false,
    required int noOfYears}) {
  final format = DateFormat(DATE_FORMATTER_YEAR_FIRST);
  DateTime dateTime = DateTime.now();

  showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height * 0.40,
          color: Colors.white,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (value) {
              if (dateFormat.format(value) != controller.text) {
                controller.text = dateFormat.format(value);
              }
            },
            initialDateTime: isLastDate
                ? DateFormat(DATE_FORMATTER_YEAR_FIRST).parse(format
                    .format(DateTime(DateTime.now().year - (noOfYears * 2))))
                : DateFormat(DATE_FORMATTER_YEAR_FIRST)
                    .parse(startDate?.text ?? format.format(dateTime)),
            minimumDate: isLastDate
                ? DateFormat(DATE_FORMATTER_YEAR_FIRST)
                    .parse(format.format(DateTime(DateTime.now().year - 100)))
                : isEndDate
                    ? DateFormat(DATE_FORMATTER_YEAR_FIRST)
                        .parse(startDate?.text ?? format.format(dateTime))
                    : dateTime.subtract(const Duration(days: 365000)),
            maximumDate: isLastDate
                ? DateFormat(DATE_FORMATTER_YEAR_FIRST).parse(
                    format.format(DateTime(DateTime.now().year - noOfYears)))
                : dateTime.add(const Duration(days: 365000)),
          ),
        );
      });

  return controller.text;
}

bool isAdult2(String birthDateString) {
  String datePattern = DATE_FORMATTER_YEAR_FIRST;

  // Current time - at this moment
  DateTime today = DateTime.now();

  // Parsed date to check
  DateTime birthDate = DateFormat(datePattern).parse(birthDateString);

  // Date to check but moved 18 years ahead
  DateTime adultDate = DateTime(
    birthDate.year + 18,
    birthDate.month,
    birthDate.day,
  );

  return adultDate.isBefore(today);
}

class CustomCalendar {
// number of days in month
  //[JAN, FEB, MAR, APR, MAY, JUN, JUL, AUG, SEP, OCT, NOV, DEC]
  static final List<int> monthDays = [
    31,
    28,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31
  ];

// check for leap year
}

Future<TimeOfDay?> customTimePicker(
  BuildContext? context,
  TextEditingController controller,
) async {
  DateTime dateTime = DateTime.now();

  TimeOfDay? result = await showTimePicker(
      context: context!, initialTime: TimeOfDay.fromDateTime(dateTime));

  if (result != null) {
    controller.text =
        '${result.hourOfPeriod}:${result.minute < 10 ? result.periodOffset : ''}${result.minute}:${result.period.name.toUpperCase()}';

    return result;
  }

  return null; //controller.text;
}
