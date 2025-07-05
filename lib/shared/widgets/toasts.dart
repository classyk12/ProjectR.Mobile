import 'package:projectr/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

SnackBar showToast({required String message, Color? color}) => SnackBar(
      content: Text(
        message,
        style: const TextStyle(
            color: AppColors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: color ?? AppColors.red,
    );
