import 'package:flutter/material.dart';
import 'package:lowes/core/responsive/dimension.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';
import 'package:lowes/features/onboarding/presentation/widgets/chart_widget.dart';
import 'package:lowes/features/onboarding/presentation/widgets/elevation_container.dart';

class ChartMobile extends StatefulWidget {
  const ChartMobile({super.key});

  @override
  State<ChartMobile> createState() => _ChartMobileState();
}

class _ChartMobileState extends State<ChartMobile> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: 12,right: 12,bottom:  ScreenDimensions.screenHeight(context) * 0.09),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:  ScreenDimensions.screenHeight(context) * 0.01),
                customContainer(
                  radius: 12.0,
                  containerColor: white,
                  child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 7,top: 6),
                        child: Text("Total Devices",style: AppTextStyle.title),
                      ),
                      SizedBox(
                        height:  ScreenDimensions.screenHeight(context) * 0.25,
                        child: const ChartWidget(),
                      ),
                    ],
                  ),
                ),
               SizedBox(height:  ScreenDimensions.screenHeight(context) * 0.02),
                customContainer(
                  radius: 12.0,
                  containerColor: white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 7,top: 6),
                        child: Text("Total Packages",style: AppTextStyle.title),
                      ),
                      SizedBox(
                        height:  ScreenDimensions.screenHeight(context) * 0.25,
                        child: const ChartWidget(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height:  ScreenDimensions.screenHeight(context) * 0.02),
                customContainer(
                  radius: 12.0,
                  containerColor: white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 7,top: 6),
                        child: Text("Packages Status",style: AppTextStyle.title),
                      ),
                      SizedBox(
                        height:  ScreenDimensions.screenHeight(context) * 0.25,
                        child: const ChartWidget(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height:  ScreenDimensions.screenHeight(context) * 0.01),
              ],
            ),

        );
  }
}
