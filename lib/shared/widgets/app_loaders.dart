import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';

class DefaultLoaderWidget extends StatelessWidget {
  final double? height;
  const DefaultLoaderWidget({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 15.h,
      child: const CircularProgressIndicator.adaptive(),
    ).paddingSymmetric(vertical: 10.h);
  }
}
