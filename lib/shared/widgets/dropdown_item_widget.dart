import 'package:projectr/shared/styles.dart';
import 'package:projectr/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';

class DropdownItemWidget extends StatelessWidget {
  final String? item;
  final bool? selected;
  const DropdownItemWidget({super.key, this.item = '', this.selected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(item ?? '',
                style: Styles.dropdownItemTextStyle().copyWith())),
        Container(
            height: 10.h,
            width: 10.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected ?? false
                    ? Theme.of(context).primaryColor
                    : AppColors.transparent))
      ],
    ).paddingSymmetric(vertical: 10.h, horizontal: 20.w);
  }
}
