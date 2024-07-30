import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lowes/core/commonwidgets/button.dart';
import 'package:lowes/core/constants/constants.dart';
import 'package:lowes/core/responsive/dimension.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';
import 'package:lowes/features/auth/presentation/provider/auth_provider.dart';
import 'package:lowes/features/onboarding/presentation/widgets/custom_alert.dart';
import 'package:provider/provider.dart';

class SettingsMobile extends StatefulWidget {
  const SettingsMobile({super.key});

  @override
  State<SettingsMobile> createState() => _SettingsMobileState();
}

class _SettingsMobileState extends State<SettingsMobile> {

  late AuthProvider auth;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      auth = Provider.of<AuthProvider>(context, listen: false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(Constants.profileTitle, style: AppTextStyle.subTitle),
          ),
          SizedBox(height: ScreenDimensions.screenHeight(context) * 0.01),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: ScreenDimensions.screenHeight(context) * 0.01,
                horizontal: ScreenDimensions.screenWidth(context) * 0.03),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(Constants.name, style: AppTextStyle.content),
                ),
                Expanded(
                    flex: 1,
                    child: Text(
                      context.read<AuthProvider>().userName,
                      textAlign: TextAlign.end,
                      style: AppTextStyle.contentBold,
                    )),
              ],
            ),
          ),
          SizedBox(height: ScreenDimensions.screenHeight(context) * 0.01),
          const Divider(
            thickness: 1.5,
            color: primaryLight,
          ),
          SizedBox(height: ScreenDimensions.screenHeight(context) * 0.01),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: ScreenDimensions.screenHeight(context) * 0.01,
                horizontal: ScreenDimensions.screenWidth(context) * 0.03),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(Constants.email, style: AppTextStyle.content),
                ),
                Expanded(
                    flex: 1,
                    child: Text(
                      context.read<AuthProvider>().email,
                      textAlign: TextAlign.end,
                      style: AppTextStyle.contentBold,
                    )),
              ],
            ),
          ),
          SizedBox(height: ScreenDimensions.screenHeight(context) * 0.01),
          const Divider(
            thickness: 1.5,
            color: primaryLight,
          ),
          SizedBox(height: ScreenDimensions.screenHeight(context) * 0.01),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: ScreenDimensions.screenHeight(context) * 0.01,
                horizontal: ScreenDimensions.screenWidth(context) * 0.03),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(Constants.role, style: AppTextStyle.content),
                ),
                Expanded(
                    flex: 1,
                    child: Text(
                      context.read<AuthProvider>().role,
                      textAlign: TextAlign.end,
                      style: AppTextStyle.contentBold,
                    )),
              ],
            ),
          ),
          SizedBox(height: ScreenDimensions.screenHeight(context) * 0.01),
          const Divider(
            thickness: 1.5,
            color: primaryLight,
          ),
        ],
      ),
      bottomSheet: Container(
        color: white,
        height: ScreenDimensions.screenHeight(context) * 0.08,
        padding: EdgeInsets.symmetric(
            vertical: ScreenDimensions.screenHeight(context) * 0.01,
            horizontal: ScreenDimensions.screenWidth(context) * 0.05),
        child: Center(
          child: CustomButton(
            text: Constants.logout,
            buttonColor: errorLight,
            textStyle: AppTextStyle.textError,
            borderRadius: 15,
            height: ScreenDimensions.screenHeight(context) * 0.05,
            onPressed: () async{
              await showAlert(
                  title: Constants.logoutInfo,
                  image: 'assets/svg/signout.svg',
                  context: context,
                  onYes: () {
                    context.read<AuthProvider>().deleteData(context);
                  },
                  onNo: () {
                    Navigator.pop(context);
                  });
            },
          ),
        ),
      ),
    );
  }
}
