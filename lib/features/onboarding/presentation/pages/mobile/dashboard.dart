import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lowes/core/constants/constants.dart';
import 'package:lowes/core/responsive/dimension.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';
import 'package:lowes/features/onboarding/presentation/provider/onboard_provider.dart';
import 'package:lowes/features/onboarding/presentation/widgets/elevation_container.dart';
import 'package:provider/provider.dart';

class DashboardMobile extends StatefulWidget {
  const DashboardMobile({super.key});

  @override
  State<DashboardMobile> createState() => _DashboardMobileState();
}

class _DashboardMobileState extends State<DashboardMobile> {

  @override
  Widget build(BuildContext context) {
    final onboardProvider = Provider.of<OnboardProvider>(context);

    return SafeArea(
      child: Scaffold(
        body:Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Constants.dashboardInfo, style: AppTextStyle.textPrime),
              SizedBox(height: ScreenDimensions.screenHeight(context) * 0.04),
              containers(Constants.scanOnboard, onboardProvider),
              SizedBox(height: ScreenDimensions.screenHeight(context) * 0.06),
              containers(Constants.scanAssociate, onboardProvider),
              SizedBox(height: ScreenDimensions.screenHeight(context) * 0.06),
            ],
          ),
        ),
      ),
    );
  }

  Widget containers(String title, OnboardProvider provider) {
    return customContainer(
      width: double.infinity,
      height: ScreenDimensions.screenHeight(context) * 0.12,
      containerColor: white,
      onTap: () async {
          provider.scanNavigation(context,title);
      },
      radius: 12.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset("assets/svg/scanner.svg",
              width: ScreenDimensions.screenWidth(context) * 0.1,
              height: ScreenDimensions.screenHeight(context) * 0.1),
          Text(title, style: AppTextStyle.textPrime)
        ],
      ),
    );
  }

}
