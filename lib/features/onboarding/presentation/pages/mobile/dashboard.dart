import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lowes/core/constants/constants.dart';
import 'package:lowes/core/responsive/dimension.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';
import 'package:lowes/features/onboarding/presentation/pages/mobile/chart.dart';
import 'package:lowes/features/onboarding/presentation/pages/mobile/entity_list2.dart';
import 'package:lowes/features/onboarding/presentation/pages/mobile/settings.dart';
import 'package:lowes/features/onboarding/presentation/provider/onboard_provider.dart';
import 'package:lowes/features/onboarding/presentation/widgets/custom_alert.dart';
import 'package:lowes/features/onboarding/presentation/widgets/scan_option_sheet.dart';
import 'package:provider/provider.dart';

class DashboardMobile extends StatefulWidget {
  const DashboardMobile({super.key});

  @override
  State<DashboardMobile> createState() => _DashboardMobileState();
}

class _DashboardMobileState extends State<DashboardMobile> {
  final tabs = [const ChartMobile(), const ChartMobile(), const EntityList2()];

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
                backgroundColor: primaryLight,

                appBar: AppBar(
                  backgroundColor: primary,
                  elevation: 2.0,
                  title:
                  Row(
                    children: [
                      Image.asset(
                        'assets/png/hutrac_icon.png',
                        fit: BoxFit.contain,
                        width: ScreenDimensions.screenWidth(context) * 0.1,
                        height: ScreenDimensions.screenHeight(context) * 0.04,
                      ),
                      Text(Constants.appTitle, style: AppTextStyle.titleWhite),
                    ],
                  ),
                  actions: [
                    IconButton(onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SettingsMobile(),
                        ),
                      );
                    }, icon:const Icon( Icons.settings,color: Colors.white))
                  ],
                ),
                body: Stack(
                  children: [
                    tabs[provider.mobileSelectedIndex],
                  ],
                ),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: provider.mobileSelectedIndex,
                  type: BottomNavigationBarType.fixed,
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
                        activeIcon: SvgPicture.asset(
                          'assets/svg/dashboard_select.svg',
                          fit: BoxFit.contain,
                          width: ScreenDimensions.screenWidth(context) * 0.1,
                          height: ScreenDimensions.screenHeight(context) * 0.05,
                        ),
                        icon: SvgPicture.asset(
                          'assets/svg/dashboard.svg',
                          fit: BoxFit.contain,
                          width: ScreenDimensions.screenWidth(context) * 0.07,
                          height: ScreenDimensions.screenHeight(context) * 0.03,
                        ),
                        label: ''),
                    BottomNavigationBarItem(
                        activeIcon: SvgPicture.asset(
                          'assets/svg/scanner1_select.svg',
                          fit: BoxFit.contain,
                          width: ScreenDimensions.screenWidth(context) * 0.1,
                          height: ScreenDimensions.screenHeight(context) * 0.05,
                        ),
                        icon: SvgPicture.asset(
                          'assets/svg/scanner1.svg',
                          fit: BoxFit.contain,
                          width: ScreenDimensions.screenWidth(context) * 0.07,
                          height: ScreenDimensions.screenHeight(context) * 0.03,
                        ),
                        label: ''),
                    BottomNavigationBarItem(
                        activeIcon: SvgPicture.asset(
                          'assets/svg/list_select.svg',
                          fit: BoxFit.contain,
                          width: ScreenDimensions.screenWidth(context) * 0.1,
                          height: ScreenDimensions.screenHeight(context) * 0.05,
                        ),
                        icon: SvgPicture.asset(
                          'assets/svg/list.svg',
                          fit: BoxFit.contain,
                          width: ScreenDimensions.screenWidth(context) * 0.07,
                          height: ScreenDimensions.screenHeight(context) * 0.03,
                        ),
                        label: ''),
                  ],
                  onTap: (index) {
                    provider.updateBottomNavIndex(index);
                    if (index == 1) {
                      scanOptionAlert(context: context, provider: provider);
                    }
                  },
                ),
              );
            })));
  }
}
