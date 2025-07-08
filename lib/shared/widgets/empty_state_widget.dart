import 'package:projectr/shared/helpers/helper.dart';
import 'package:projectr/shared/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';

class NoDataWidget extends StatelessWidget {
  final Function() onTap;
  final String title;
  final String subtitle;
  final bool hasActionButton;
  final String buttonText;
  final String? icon;
  final double? iconHeight;
  final double? iconWidth;
  const NoDataWidget(
      {super.key,
      required this.onTap,
      required this.title,
      required this.subtitle,
      this.icon = 'search.png',
      this.iconHeight = 250,
      this.iconWidth = 250,
      required this.buttonText,
      this.hasActionButton = true});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              height: iconHeight,
              width: iconWidth,
              AppHelper.getImageFullPath(icon!),
            ),
            Text(
              title,
              textAlign: TextAlign.start,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ).paddingSymmetric(vertical: 10.h),
            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            hasActionButton
                ? Button(
                    height: 56.h,
                    color: Theme.of(context).buttonTheme.colorScheme!.primary,
                    textColor: Theme.of(context).textTheme.bodyLarge!.color,
                    onPressed: onTap,
                    text: buttonText,
                  )
                : const SizedBox(),
          ]),
    ).paddingSymmetric(horizontal: 30.w, vertical: 10.h);
  }
}
