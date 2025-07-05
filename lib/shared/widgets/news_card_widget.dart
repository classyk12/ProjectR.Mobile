import 'package:projectr/shared/domain/models/news/news_model.dart';
import 'package:projectr/shared/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:intl/intl.dart';

class NewsCardWidget extends StatelessWidget {
  final NewsModel data;
  const NewsCardWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        //TODO; navigate to external new website
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Container(
              width: width * .6,
              height: height * .2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: data.urlToImage == null || data.urlToImage.isEmpty
                          ? AssetImage(
                              AppHelper.getImageFullPath('cardinalstone.png'))
                          : NetworkImage(data.urlToImage))),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Text(
                    DateFormat.yMMMM().format(data.publishedAt),
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                        fontWeight: FontWeight.w700,
                        fontSize: 10.sp),
                    overflow: TextOverflow.clip,
                  ).paddingSymmetric(horizontal: 10.w),
                ),
              ).paddingSymmetric(vertical: 10.h, horizontal: 10.w),
            ),
          ),
          SizedBox(width: width * .6, child: Text(data.title))
        ],
      ),
    );
  }
}
