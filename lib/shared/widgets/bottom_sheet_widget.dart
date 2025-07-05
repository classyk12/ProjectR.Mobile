import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

modalBottomSheet(BuildContext ctx, dynamic widget,
    {bool isScrollControlled = true,
    double? height,
    Color? barrierColor,
    Widget? icon,
    String? title,
    double? titleTextSize,
    TextAlign? titleTextAligment,
    bool isDismissible = false,
    bool isDragDismissible = false,
    Color? titleColor,
    Color? backgroundColor,
    VoidCallback? onDismiss}) {
  showModalBottomSheet(
    enableDrag: isDragDismissible,
    context: ctx,
    isScrollControlled: isScrollControlled,
    isDismissible: isDismissible,
    barrierColor: barrierColor ?? Colors.black.withOpacity(.5),
    backgroundColor: backgroundColor,
    showDragHandle: false,
    builder: (context) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.pop(context),
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setModalState) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    color: Theme.of(ctx).colorScheme.surface,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0))),
                height: height,
                child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: backgroundColor ??
                            Theme.of(context).colorScheme.surface,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0))),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          icon ?? const SizedBox(),
                          Text(
                            title ?? '',
                            style: TextStyle(
                                color: titleColor ??
                                    Theme.of(context).primaryColor,
                                fontSize: titleTextSize ?? 20.sp,
                                fontWeight: FontWeight.w700),
                            textAlign: titleTextAligment ?? TextAlign.center,
                          ),
                          widget,
                        ],
                      ),
                    )),
              ),
            );
          }),
        ),
      );
    },
  ).whenComplete(() {
    if (onDismiss != null) onDismiss(); // Call the dismissal callback
  });
}
