import 'package:projectr/shared/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';

class ShowErrorWidget extends StatelessWidget {
  final Function()? onReload;
  final String? body;
  final bool? hasButton;

  const ShowErrorWidget(
      {super.key, this.onReload, this.body = '', this.hasButton = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onReload,
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppHelper.getImageFullPath('error_icon.png'),
                height: 150.h,
                width: 150.w,
              ),
              Text(
                body ?? 'Tap to try again',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textTheme.bodyLarge!.color),
              ).paddingSymmetric(vertical: 10.h),
            ]),
      ).animate().scale(),
    );
  }
}
