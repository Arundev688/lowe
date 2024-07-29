import 'package:flutter/material.dart';
import 'package:lowes/core/theme/fonts.dart';
import 'package:lowes/features/onboarding/presentation/widgets/chart_widget.dart';

class ChartMobile extends StatefulWidget {
  const ChartMobile({super.key});

  @override
  State<ChartMobile> createState() => _ChartMobileState();
}

class _ChartMobileState extends State<ChartMobile> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
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
    );
  }
}
