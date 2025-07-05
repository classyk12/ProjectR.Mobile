import 'dart:ui';
import 'package:projectr/shared/helpers/helper.dart';
import 'package:projectr/shared/themes/app_colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DocumentUploaderWidget extends StatefulWidget {
  final List<String> options;
  final Color backgroundColor;
  const DocumentUploaderWidget({
    super.key,
    required this.options,
    this.backgroundColor = AppColors.extraLightGrey,
  });

  @override
  State<DocumentUploaderWidget> createState() => _DocumentUploaderWidgetState();
}

class _DocumentUploaderWidgetState extends State<DocumentUploaderWidget> {
  List<String> options = <String>[];
  @override
  void initState() {
    options = widget.options;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
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
                  color: widget.backgroundColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0))),
              height: options.length > 2 ? height * .5 : height * .3,
              child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).bottomSheetTheme.backgroundColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0))),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CircleAvatar(
                            radius: 30,
                            backgroundColor:
                                Theme.of(context).primaryColor.withOpacity(0.1),
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: Icon(
                                Icons.arrow_circle_right_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 30,
                              ),
                            )).paddingOnly(bottom: 10.h),
                        Text(
                          'Upload',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        uploadOptions(),
                      ],
                    ),
                  )),
            ),
          );
        }),
      ),
    );
  }

  uploadOptions() {
    XFile? file;
    return StatefulBuilder(
      builder: (context, vsetState) {
        return Column(
                children: options.map((e) {
          return GestureDetector(
            onTap: () async {
              switch (e.toLowerCase()) {
                case 'use camera':
                  file = await pickImage(ImageSource.camera, context);

                  break;
                case 'upload photo':
                  file = await pickImage(ImageSource.gallery, context);
                  break;
                default:
                  file = await pickFile(context);
              }
              if (context.mounted) {
                Navigator.pop(context, file);
              }
            },
            child: Row(
              children: [
                CircleAvatar(
                    radius: 20,
                    backgroundColor:
                        Theme.of(context).primaryColor.withOpacity(0.1),
                    child: Image.asset(
                      color: Theme.of(context).primaryColor,
                      AppHelper.getImageFullPath(e.contains('Camera')
                          ? 'camera.png'
                          : e.contains('Photo')
                              ? 'gallery.png'
                              : 'document.png'),
                      height: 40.h,
                      width: 40.w,
                    )).paddingOnly(left: 10.w, right: 15.w),
                Text(
                  e,
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp),
                ),
                const Expanded(child: SizedBox()),
                Icon(
                  Icons.chevron_right_outlined,
                  size: 30,
                  color: Theme.of(context).iconTheme.color,
                )
              ],
            ).paddingSymmetric(vertical: 15.h),
          );
        }).toList())
            .paddingOnly(top: 20.h);
      },
    );
  }

  Future<XFile?> pickImage(ImageSource source, BuildContext context) async {
    var picker = ImagePicker();
    var pick = await picker.pickImage(source: source);
    if (pick == null) {
      return null;
    }
    return pick;
    // return File(pick.path);
  }

  Future<XFile?> pickFile(BuildContext context) async {
    var pick = await FilePicker.platform.pickFiles(
        allowedExtensions: ['pdf'],
        type: FileType.custom,
        allowMultiple: false);
    if (pick == null) {
      return null;
    }
    return pick.xFiles.first;
    //return File(pick.files.first.path!);
  }
}
