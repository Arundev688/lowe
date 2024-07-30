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
          padding:  const EdgeInsets.symmetric(horizontal: 12),
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
                      Text("Total Devices",style: AppTextStyle.title),
                      const SizedBox(
                        height: 220,
                        child: ChartWidget(),
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
                      Text("Total Packages",style: AppTextStyle.title),
                      const SizedBox(
                        height: 220,
                        child: ChartWidget(),
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
                      Text("Packages Status",style: AppTextStyle.title),
                      const SizedBox(
                        height: 220,
                        child: ChartWidget(),
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
