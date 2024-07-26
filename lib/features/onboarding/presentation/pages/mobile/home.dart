import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lowes/core/constants/constants.dart';
import 'package:lowes/core/responsive/dimension.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';
import 'package:lowes/features/onboarding/presentation/pages/mobile/scan_result.dart';
import 'package:lowes/features/onboarding/presentation/provider/onboard_provider.dart';
import 'package:lowes/features/onboarding/presentation/widgets/elevation_container.dart';
import 'package:provider/provider.dart';

class OnboardMobile extends StatefulWidget {
  const OnboardMobile({super.key});

  @override
  State<OnboardMobile> createState() => _OnboardMobileState();
}

class _OnboardMobileState extends State<OnboardMobile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardProvider>(
        builder: (context, onboardProvider, child) {
      return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: ScreenDimensions.screenHeight(context) * 0.04),
                InkWell(
                    onTap: () async {
                      final scanResult =
                          await onboardProvider.scanBarcode(context);
                      if (scanResult != null) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScanResult(scanResult:scanResult,title: Constants.scanOnboard),
                            ),
                          );
                        });
                      }
                    },
                    child: containers(Constants.scanOnboard)),
                SizedBox(height: ScreenDimensions.screenHeight(context) * 0.06),
                InkWell(
                    onTap: ()async {
                      final scanResult =
                          await onboardProvider.scanBarcode(context);
                      if (scanResult != null) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScanResult(scanResult:scanResult,title: Constants.scanAssociate),
                            ),
                          );
                        });
                      }
                    },
                    child: containers(Constants.scanAssociate)),
                SizedBox(height: ScreenDimensions.screenHeight(context) * 0.06),
              ],
            ),
          ),
        );
    });
  }

  Widget containers(String title) {
    return customContainer(
      width: double.infinity,
      height: ScreenDimensions.screenHeight(context) * 0.12,
      containerColor: white,
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
