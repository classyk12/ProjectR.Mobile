import 'package:projectr/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndicatorWidget extends StatelessWidget {
  final bool isActive;
  final Color activeColor;

  const IndicatorWidget({
    super.key,
    required this.isActive,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 4.0.w),
      height: 7.h,
      width: 70.w,
      decoration: BoxDecoration(
          color: isActive ? activeColor : AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(16.r))),
    );
  }
}

List<Widget> buildPageIndicator(int totalPages, int currentPage,
    {Color? activeColor = AppColors.primary}) {
  List<Widget> list = [];
  for (int i = 0; i < totalPages; i++) {
    list.add(i == currentPage
        ? IndicatorWidget(isActive: true, activeColor: activeColor!)
        : IndicatorWidget(
            isActive: false,
            activeColor: activeColor!,
          ));
  }
  return list;
}

Widget indicatorWithStepsWidget(
    {required BuildContext context,
    required String leading,
    required String subtitle,
    required int totalpages,
    required int currentpage,
    Color leadingTextColor = AppColors.primary,
    Color subtitleTextColor = AppColors.black}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(leading,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600)),
          Wrap(
            children: buildPageIndicator(totalpages, currentpage,
                activeColor: Theme.of(context).primaryColor),
          )
        ],
      ),
      Text(subtitle,
          style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge!.color,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600)),
    ],
  );
}
