import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lowes/core/constants/constants.dart';
import 'package:lowes/core/responsive/dimension.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';
import 'package:lowes/features/onboarding/presentation/pages/mobile/chart.dart';
import 'package:lowes/features/onboarding/presentation/pages/mobile/entities_list.dart';
import 'package:lowes/features/onboarding/presentation/pages/mobile/scan_options.dart';
import 'package:lowes/features/onboarding/presentation/pages/mobile/settings.dart';
import 'package:lowes/features/onboarding/presentation/provider/onboard_provider.dart';
import 'package:lowes/features/onboarding/presentation/widgets/custom_alert.dart';
import 'package:provider/provider.dart';

class DashboardMobile extends StatefulWidget {
  const DashboardMobile({super.key});

  @override
  State<DashboardMobile> createState() => _DashboardMobileState();
}

class _DashboardMobileState extends State<DashboardMobile> {
  final tabs = [
    const ChartMobile(),
    const ScanOptions(),
    const EntitiesList(),
    const SettingsMobile(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) async {
             await showAlert(
                  title: Constants.exitInfo,
                  image: 'assets/svg/signout.svg',
                  context: context,
                  onYes: () {
                    SystemNavigator.pop();
                  },
                  onNo: () {
                    Navigator.pop(context);
                  });
            },
            child: Consumer<OnboardProvider>(builder: (i, provider, p) {
              return Scaffold(
                backgroundColor: white,
                appBar: AppBar(
                  backgroundColor: primary,
                  elevation: 2.0,
                  title:
                      Text(Constants.appTitle, style: AppTextStyle.titleWhite),
                ),
                body: tabs[provider.mobileSelectedIndex],
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: provider.mobileSelectedIndex,
                  type: BottomNavigationBarType.shifting,
                  selectedItemColor: primary,
                  elevation: 8.0,
                  showSelectedLabels: true,
                  showUnselectedLabels: false,
                  backgroundColor: white,
                  selectedLabelStyle: AppTextStyle.textField.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: textColor,
                  ),
                  items: [
                    BottomNavigationBarItem(
                        activeIcon: Image.asset(
                          'assets/png/dashboard.png',
                          fit: BoxFit.contain,
                          width: ScreenDimensions.screenWidth(context) * 0.1,
                          height: ScreenDimensions.screenHeight(context) * 0.05,
                        ),
                        icon: Image.asset(
                          'assets/png/dashboard_unselect.png',
                          fit: BoxFit.contain,
                          width: ScreenDimensions.screenWidth(context) * 0.09,
                          height: ScreenDimensions.screenHeight(context) * 0.05,
                        ),
                        label: Constants.mobileDashboardMenu[0]),
                    BottomNavigationBarItem(
                        activeIcon: Image.asset(
                          'assets/png/scanner.png',
                          fit: BoxFit.contain,
                          width: ScreenDimensions.screenWidth(context) * 0.1,
                          height: ScreenDimensions.screenHeight(context) * 0.05,
                        ),
                        icon: Image.asset(
                          'assets/png/scanner_unselect.png',
                          fit: BoxFit.contain,
                          width: ScreenDimensions.screenWidth(context) * 0.09,
                          height: ScreenDimensions.screenHeight(context) * 0.05,
                        ),
                        label: Constants.mobileDashboardMenu[1]),
                    BottomNavigationBarItem(
                        activeIcon: Image.asset(
                          'assets/png/list.png',
                          fit: BoxFit.contain,
                          width: ScreenDimensions.screenWidth(context) * 0.1,
                          height: ScreenDimensions.screenHeight(context) * 0.05,
                        ),
                        icon: Image.asset(
                          'assets/png/list_unselect.png',
                          fit: BoxFit.contain,
                          width: ScreenDimensions.screenWidth(context) * 0.09,
                          height: ScreenDimensions.screenHeight(context) * 0.05,
                        ),
                        label: Constants.mobileDashboardMenu[2]),
                    BottomNavigationBarItem(
                        activeIcon: Image.asset(
                          'assets/png/settings.png',
                          fit: BoxFit.contain,
                          width: ScreenDimensions.screenWidth(context) * 0.1,
                          height: ScreenDimensions.screenHeight(context) * 0.05,
                        ),
                        icon: Image.asset(
                          'assets/png/settings_unselect.png',
                          fit: BoxFit.contain,
                          width: ScreenDimensions.screenWidth(context) * 0.09,
                          height: ScreenDimensions.screenHeight(context) * 0.05,
                        ),
                        label: Constants.mobileDashboardMenu[3]),
                  ],
                  onTap: (index) {
                    provider.updateBottomNavIndex(index);
                  },
                ),
              );
            })));
  }
}
