// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';

class AppHeaderWidget extends StatelessWidget {
  final ThemeData currentTheme;
  const AppHeaderWidget({
    super.key,
    required this.currentTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50.h,
          decoration: BoxDecoration(
              color: currentTheme
                  .primaryColor //Theme.of(context).appBarTheme.backgroundColor,
              ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.surface,
            ),
            child: Image.asset('assets/images/embelm.png',
                fit: BoxFit.contain, height: 63.h, width: 63.w),
          ),
        ).paddingOnly(top: 20.h, left: 20.w),
      ],
    );
  }
}
