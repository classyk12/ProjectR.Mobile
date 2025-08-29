import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:projectr/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectr/shared/helpers/helper.dart';
import 'package:projectr/shared/themes/app_colors.dart';
import 'package:projectr/shared/widgets/bottom_nav_widget.dart';
import 'package:projectr/shared/widgets/button.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  bool isEmptySlate = false;
  late double width = MediaQuery.of(context).size.width;
  late double height = MediaQuery.of(context).size.height;
  final _appointmentActions = [
    'Reschedule',
    'Adjust Reminder',
    'Cancel Appointment'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider).currentTheme;

    return Scaffold(
      backgroundColor: currentTheme.appBarTheme.foregroundColor,
      floatingActionButton: Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: currentTheme.colorScheme.primary),
        child: Icon(
          Icons.add,
          color: currentTheme.colorScheme.surface,
          size: 25,
        ),
      ),
      bottomNavigationBar: BottomNavWidget(
        selectedIndex: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(currentTheme),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My booking link',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: currentTheme.textTheme.bodyLarge!.color),
                    ).paddingOnly(bottom: 5.h),
                    Text(
                      'Copy your unique link to share with customers',
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.darkGrey),
                    ).paddingOnly(bottom: 5.h),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.copy_outlined,
                        size: 15,
                      ),
                      Text(
                        ' Copy',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: currentTheme.textTheme.bodyLarge!.color),
                      ).paddingOnly(bottom: 5.h),
                    ])
              ]),
              isEmptySlate
                  ? _emptySlateView(currentTheme)
                  : _upcomingAppointmentView(currentTheme),
              isEmptySlate
                  ? _emptySlateView(currentTheme)
                  : _requestsView(currentTheme)
            ],
          ).paddingSymmetric(vertical: 50.h, horizontal: 20.w),
        ),
      ),
    );
  }

  Widget _header(ThemeData currentTheme) {
    return Row(
      children: [
        Text('Hi, Joy Enterprise',
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: currentTheme.textTheme.bodyLarge!.color)),
        Image.asset(AppHelper.getImageFullPath('confetti.png'),
                width: 20.w, height: 20.h)
            .paddingSymmetric(horizontal: 10.w),
        const Expanded(child: SizedBox()),
        Stack(children: [
          const Icon(
            Icons.notifications_outlined,
            size: 30,
          ),
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentTheme.colorScheme.primary),
            child: Text('5',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: currentTheme.colorScheme.surface)),
          ).paddingOnly(left: 15.w, bottom: 10.h)
        ])
      ],
    ).paddingOnly(top: 15.h, bottom: 30.h);
  }

  Widget _emptySlateView(ThemeData currentTheme) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppHelper.getImageFullPath('empty_dashboard.png'),
              width: 300.w, height: 300.h),
          Center(
            child: Text(
              'You have no upcoming appointments.\nWhen you do, they’ll appear here.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: currentTheme.textTheme.bodyLarge!.color),
            ).paddingOnly(bottom: 5.h),
          ).paddingSymmetric(vertical: 20.h),
          Container(
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentTheme.colorScheme.primary),
            child: Icon(
              Icons.add,
              color: currentTheme.colorScheme.surface,
              size: 25,
            ),
          )
        ]).paddingSymmetric(vertical: 20.h);
  }

  Widget _upcomingAppointmentView(ThemeData currentTheme) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.lightGrey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10.r)),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: currentTheme.colorScheme.primary,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r))),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Upcoming Appointments',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: currentTheme.colorScheme.surface)),
            Text('See all',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: currentTheme.colorScheme.surface))
          ]),
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Today at 9:30 AM',
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: currentTheme.textTheme.bodyLarge!.color))
                  .paddingSymmetric(vertical: 10.h),
              RichText(
                text: TextSpan(
                  text: 'Work meeting with',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: currentTheme.textTheme.bodyLarge!.color),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' Segun Areola ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: currentTheme.textTheme.bodyLarge!.color)),
                  ],
                ),
              ),
              Row(children: [
                Image.asset(AppHelper.getImageFullPath('reminder.png'),
                    color: currentTheme.colorScheme.primary,
                    width: 20.w,
                    height: 20.h),
                Text('\tStarts in 33 minutes',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal,
                        color: currentTheme.textTheme.bodyLarge!.color)),
                const Expanded(child: SizedBox()),
                _appointmentActionMenu(context),
              ]).paddingSymmetric(vertical: 10.h),
            ]).paddingAll(15)
      ]),
    ).paddingSymmetric(vertical: 15.h);
  }

  Widget _appointmentActionMenu(BuildContext context) {
    return PopupMenuButton(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width,
        ),
        position: PopupMenuPosition.under,
        splashRadius: 0,
        itemBuilder: (context) {
          return List.generate(_appointmentActions.length, (index) {
            return PopupMenuItem(
              onTap: () {},
              child: Text(_genders[index],
                  style: Theme.of(context).textTheme.bodyMedium),
            );
          });
        },
        child: const RotatedBox(
            quarterTurns: 3,
            child: Icon(
              Icons.more_horiz_outlined,
              size: 20,
            )));
  }

  Widget _requestsView(ThemeData currentTheme) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.lightGrey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10.r)),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: AppColors.darkGrey.withOpacity(0.5),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r))),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Pending Requests',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: currentTheme.textTheme.bodyLarge!.color)),
            Text('See all',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: currentTheme.textTheme.bodyLarge!.color,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: currentTheme.textTheme.bodyLarge!.color))
          ]),
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Friday 26th at 9:30 AM',
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: currentTheme.textTheme.bodyLarge!.color))
                  .paddingSymmetric(vertical: 10.h),
              RichText(
                text: TextSpan(
                  text: 'Halaga\'s venture meeting with ',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: currentTheme.textTheme.bodyLarge!.color),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' Segun Areola ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: currentTheme.textTheme.bodyLarge!.color)),
                  ],
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Button(
                  onPressed: () {},
                  width: width * .4,
                  height: 40.h,
                  text: 'Accept',
                  color: AppColors.primary,
                  textColor: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                Button(
                  onPressed: () {},
                  width: width * .4,
                  height: 40.h,
                  text: 'Decline',
                  color: AppColors.transparent,
                  textColor: currentTheme.textTheme.bodyLarge!.color,
                  borderColor: currentTheme.textTheme.bodyLarge!.color,
                  fontWeight: FontWeight.bold,
                ),
              ]).paddingSymmetric(vertical: 15.h),
            ]).paddingAll(15)
      ]),
    ).paddingSymmetric(vertical: 15.h);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
