import 'package:flutter/material.dart';
import 'package:lowes/core/theme/fonts.dart';
import 'package:lowes/features/onboarding/presentation/widgets/elevation_container.dart';


class Mutualfundlist extends StatelessWidget {
  const Mutualfundlist(
      {super.key,
     /*   required this.title,
        required this.status,
        required this.val1,
        required this.val2,
        required this.val3,
        required this.isProfit,
        required this.profitlose,
        required this.colorsData,*/

      });

 /* final String title;
  final String status;
  final int val1;
  final int val2;
  final int val3;
  final num profitlose;
  final bool isProfit;
  final String colorsData;*/

  @override
  Widget build(BuildContext context) {
    return customContainer(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 1,
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("PID*",
                              style: AppTextStyle.contentLight1),
                          Text("PID-ed5478", style: AppTextStyle.content1)
                        ],
                      ),),
                 SizedBox(width: 10,),
                 Expanded(
                     flex: 1,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Status",
                             style: AppTextStyle.contentLight1),
                         Text("Associated", style: AppTextStyle.content1)
                       ],
                     ),)

                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Alerts",
                            style: AppTextStyle.contentLight1),
                        Text("Threshold Breached", style: AppTextStyle.content1)
                      ],
                    ),),
                  SizedBox(width: 10,),
                  Expanded(
                    flex: 1,
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Health",
                            style: AppTextStyle.contentLight1),
                        Text("Good", style: AppTextStyle.content1)
                      ],
                    ),),

                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Location Name",
                            style: AppTextStyle.contentLight1),
                        Text("BDC11_EAST_1", style: AppTextStyle.content1)
                      ],
                    ), ),
                  SizedBox(width: 10,),
                  Expanded(
                    flex: 1,
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Location Category",
                            style: AppTextStyle.contentLight1),
                        Text("BCD", style: AppTextStyle.content1)
                      ],
                    ),  ),

                ],
              ),

              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child:   Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Location Coordinates",
                            style: AppTextStyle.contentLight1),
                        Text("Bellandur", style: AppTextStyle.content1)
                      ],
                    ), ),
                  SizedBox(width: 10,),
                  Expanded(
                    flex: 1,
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Telemetry Updated",
                            style: AppTextStyle.contentLight1),
                        Text("2024-07-03", style: AppTextStyle.content1)
                      ],
                    ), ),

                ],
              ),
            ],
          ),
        ));
  }
}
