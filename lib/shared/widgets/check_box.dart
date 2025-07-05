import 'package:projectr/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? checkIconColor;
  final double? height;
  final double? width;
  final double? borderWidth;
  final double? iconSize;

  const CircularCheckbox({
    required this.value,
    required this.onChanged,
    super.key,
    this.activeColor,
    this.inactiveColor,
    this.checkIconColor,
    this.height,
    this.width,
    this.borderWidth,
    this.iconSize,
  });

  @override
  State<CircularCheckbox> createState() => _CircularCheckboxState();
}

class _CircularCheckboxState extends State<CircularCheckbox> {
  bool _value = false;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value;
          widget.onChanged(_value);
        });
      },
      child: Container(
        height: widget.height?.h ?? 24.h,
        width: widget.width?.h ?? 24.w,
        decoration: BoxDecoration(
          color:
              _value ? widget.activeColor ?? Colors.blue : Colors.transparent,
          border: Border.all(
            color: _value
                ? widget.activeColor ?? Colors.blue
                : widget.inactiveColor ?? AppColors.grey,
            width: widget.borderWidth?.w ?? 2.w,
          ),
          shape: BoxShape.circle,
        ),
        child: _value
            ? Icon(
                Icons.check,
                color: widget.checkIconColor ?? AppColors.white,
                size: widget.iconSize?.sp ?? 16.sp,
              )
            : null,
      ),
    );
  }
}
