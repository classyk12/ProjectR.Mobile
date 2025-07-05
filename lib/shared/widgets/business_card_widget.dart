import 'package:projectr/shared/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusinessCardWidget extends StatelessWidget {
  const BusinessCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.h,
        width: 200.w,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    AppHelper.getImageFullPath('security_trading.png'))),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('N500.0'),
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.purple, shape: BoxShape.circle),
                  child: const Icon(Icons.chevron_right))
            ],
          ),
        ));
  }
}
