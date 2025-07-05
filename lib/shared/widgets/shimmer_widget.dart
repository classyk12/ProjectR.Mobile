import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

shimmerTemplate(BuildContext context,
    {required Widget child, double? shimmerWidth}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey,
    highlightColor: Colors.grey[100]!,
    child: Container(
        width: shimmerWidth ?? MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        height: MediaQuery.of(context).size.height * .15,
        child: child),
  );
}

// Updated shimmerWidget
shimmerWidget(BuildContext context, int count, Axis scrollDirection,
    {double height = 110,
    double? width,
    bool allowScroll = false,
    double? shimmerWidth}) {
  return shimmerTemplate(
    context,
    shimmerWidth: shimmerWidth,
    child: ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: height * count,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: allowScroll
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        scrollDirection: scrollDirection,
        itemCount: count,
        itemBuilder: (context, index) {
          return Container(
            height: height,
            width: width ?? MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.5),
            ),
            child: const SizedBox(),
          ).paddingSymmetric(vertical: 20.h, horizontal: 10.w);
        },
      ),
    ),
  );
}

getLoadingShimmerWidget(BuildContext context, int lenght, {double? height}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey,
    highlightColor: Colors.grey[100]!,
    child: Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      padding: EdgeInsets.zero,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          itemCount: lenght,
          itemBuilder: (ctx, index) {
            return Container(
              height: height ?? 100.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.5),
              ),
              child: const SizedBox(),
            ).paddingSymmetric(vertical: 20.h, horizontal: 10.w);
          }),
    ),
  );
}
