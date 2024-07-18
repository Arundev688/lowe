import 'package:flutter/material.dart';
import 'package:lowes/core/constants/constants.dart';
import 'package:lowes/core/responsive/dimension.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';
import 'package:lowes/features/onboarding/presentation/pages/web/dashboard.dart';

class HomeWeb extends StatefulWidget {
  const HomeWeb({super.key});

  @override
  State<HomeWeb> createState() => _HomeWebState();
}

class _HomeWebState extends State<HomeWeb> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: Constants.tabBarTitles.length,
        child: Scaffold(
          appBar: AppBar(
            elevation: 1.0,
            shadowColor: lightText,
            title: Row(
              children: [
                Text(
                  Constants.appTitle,
                  style: AppTextStyle.title,
                ),
                Expanded(
                    flex: 4,
                    child: Center(
                      child: TabBar(
                        unselectedLabelColor: lightText,
                        labelColor: black,
                        splashFactory: NoSplash.splashFactory,
                        dividerColor: Colors.transparent,
                        indicatorColor: Colors.transparent,
                        isScrollable: true,
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        onTap: (index) => {
                          setState(() {
                            _selectedIndex = index;
                          })
                        },
                        tabs: Constants.tabBarTitles
                            .map(
                              (title) => Text(title),
                            )
                            .toList(),
                      ),
                    )),
                 Expanded(flex: 1, child: Row(children: [
                  const Text("User"),
                  SizedBox(width:  ScreenDimensions.screenWidth(context) * 0.03,),
                  const Icon(Icons.notifications_active)
                ],))
              ],
            ),
          ),
          body: IndexedStack(
            index: _selectedIndex,
            children: const [
              DashboardWeb(),
              Text("Onboard Assets"),
              Text("Associate Entitles"),
              Text("Live Tracking"),
            ],
          ),
        ));
  }
}
