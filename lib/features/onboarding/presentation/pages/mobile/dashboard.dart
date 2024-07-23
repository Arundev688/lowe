import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lowes/core/constants/constants.dart';
import 'package:lowes/core/responsive/dimension.dart';
import 'package:lowes/core/route/constant.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';
import 'package:lowes/features/auth/presentation/provider/auth_provider.dart';
import 'package:lowes/features/onboarding/presentation/pages/mobile/custom_scanner.dart';
import 'package:lowes/features/onboarding/presentation/pages/mobile/scan_result.dart';
import 'package:lowes/features/onboarding/presentation/provider/onboard_provider.dart';
import 'package:lowes/features/onboarding/presentation/widgets/elevation_container.dart';
import 'package:provider/provider.dart';
import 'package:simple_barcode_scanner/enum.dart';

class DashboardMobile extends StatefulWidget {
  const DashboardMobile({super.key});

  @override
  State<DashboardMobile> createState() => _DashboardMobileState();
}

class _DashboardMobileState extends State<DashboardMobile> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Consumer<OnboardProvider>(
        builder: (context, onboardProvider, child) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: primary,
            elevation: 2.0,
            title: Text(Constants.appTitle, style: AppTextStyle.titleWhite),
            actions: [
              IconButton(
                  onPressed: ()async {
                    await authProvider.deleteData();
                    if (!context.mounted) return;
                    context.go('/loginMobile');
                  },
                  icon: const Icon(Icons.logout, color: white))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Constants.dashboardInfo, style: AppTextStyle.textPrime),
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
                          /*     context.goNamed(
                            '/ScanResult',
                            queryParameters: {'scanResult': scanResult, 'scanTitle': Constants.scanOnboard},
                          );*/
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
