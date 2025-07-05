import 'package:projectr/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OTPInputField extends StatefulWidget {
  final TextEditingController controller;

  const OTPInputField({super.key, required this.controller});

  @override
  State<OTPInputField> createState() => _OTPInputFieldState();
}

class _OTPInputFieldState extends State<OTPInputField> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(6, (_) => TextEditingController());
    _focusNodes = List.generate(6, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  _onChange({String value = '', int index = 0}) {
    if (value.length == 1 && index < 5) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }

    setState(() {});
    _updateParentController();
  }

  void _updateParentController() {
    widget.controller.text = _controllers.map((c) => c.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(6, (index) {
        return SizedBox(
          width: 50.w,
          height: 50.h,
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.number,
            style: Theme.of(context).textTheme.headlineMedium,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
            obscureText: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10.h),
              counterText: '',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: _controllers[index].text.isNotEmpty
                      ? AppColors.primary
                      : AppColors.lightGrey,
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: _controllers[index].text.isNotEmpty
                        ? AppColors.primary
                        : AppColors.lightGrey),
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            onChanged: (value) => _onChange(index: index, value: value),
          ),
        );
      }),
    );
  }
}
