import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
import 'package:lowes/features/onboarding/presentation/widgets/scan_option_sheet.dart';
import 'package:provider/provider.dart';

class DashboardMobile extends StatefulWidget {
  const DashboardMobile({super.key});

  @override
  State<DashboardMobile> createState() => _DashboardMobileState();
}

class _DashboardMobileState extends State<DashboardMobile> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final tabs = [
    /*  const ScanOptions(),*/
    const ChartMobile(),
    const EntitiesList(),
    /*const SettingsMobile(),*/
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
                backgroundColor: lightGray,
                extendBody: true,
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
                body: tabs[_selectedIndex],
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    scanOptionAlert(context: context,provider: provider);
                  },
                  child: Image.asset(
                    'assets/png/scanner.png',
                    fit: BoxFit.contain,
                    width: ScreenDimensions.screenWidth(context) * 0.1,
                    height: ScreenDimensions.screenHeight(context) * 0.05,
                  ),
                ),
                bottomNavigationBar:BottomAppBar(
                      color: Colors.white,
                      height: 60,
                      shape: const CircularNotchedRectangle(),
                      notchMargin: 10.0,
                      elevation: 12.0,
                      clipBehavior: Clip.antiAlias,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildNavBarItem("assets/png/dashboard.png",'assets/png/dashboard_unselect.png',0),
                          buildNavBarItem('assets/png/list.png','assets/png/list_unselect.png',1),
                      ],)
                      ),

              );
            })));
  }

  Widget buildNavBarItem(String selectedImage,String image, int index) {
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            _selectedIndex == index ? selectedImage : image,
            fit: BoxFit.fitHeight,
            width: ScreenDimensions.screenWidth(context) * 0.13,
            height: ScreenDimensions.screenHeight(context) * 0.04,
          ),
        ],
      ),
    );
  }

}
