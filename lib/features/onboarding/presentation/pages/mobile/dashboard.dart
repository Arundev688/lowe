import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lowes/core/constants/constants.dart';
import 'package:lowes/core/responsive/dimension.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';
import 'package:lowes/features/onboarding/presentation/widgets/elevation_container.dart';
import 'package:simple_barcode_scanner/enum.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';


class DashboardMobile extends StatefulWidget {
  const DashboardMobile({super.key});

  @override
  State<DashboardMobile> createState() => _DashboardMobileState();
}

class _DashboardMobileState extends State<DashboardMobile> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Constants.dashboardInfo,style: AppTextStyle.textPrime),
              SizedBox(
                  height: ScreenDimensions.screenHeight(context) * 0.04),
              containers(Constants.scanOnboard),
              SizedBox(
                  height: ScreenDimensions.screenHeight(context) * 0.06),
              containers(Constants.scanAssociate),
              SizedBox(
                  height: ScreenDimensions.screenHeight(context) * 0.06),
              Text('Scan Result: $result'),
            ],
          ),
        ),
      ),
    );
  }

  Widget containers(String title) {
    return customContainer(
      width: double.infinity,
      height: ScreenDimensions.screenHeight(context) * 0.12,
      containerColor: white,
      onTap:() async {
        var res = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SimpleBarcodeScannerPage(
                scanType: ScanType.defaultMode,
              ),
            ));
        setState(() {
          if (res is String) {
            result = res;
          }
        });
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