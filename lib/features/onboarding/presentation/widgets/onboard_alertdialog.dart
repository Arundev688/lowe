import 'package:flutter/material.dart';
import 'package:lowes/core/commonwidgets/button.dart';
import 'package:lowes/core/responsive/dimension.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';
import 'package:lowes/features/onboarding/presentation/provider/onboard_provider.dart';

showAlert(
    {required BuildContext context,
      required String name,
      required OnboardProvider provider,
      }) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Material(
            borderRadius: BorderRadius.circular(8),
            color: secondaryGray,
            child: Container(
              width:  ScreenDimensions.screenWidth(context) * 0.85,
              height:  ScreenDimensions.screenHeight(context) * 0.3,
              padding: const EdgeInsets.all(15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: secondaryGray, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                     Text("Sure you want to onboard this asset?",style: AppTextStyle.title),
                  SizedBox(height: ScreenDimensions.screenHeight(context) * 0.06),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(children: [
                          Expanded(
                              flex: 1,
                              child:  CustomButton(
                                text: "No, cancel",
                                borderRadius: 12.0,
                                buttonColor: white,
                                onPressed: () {
                                 provider.clearScan(context);
                                },
                              ),),
                      SizedBox(width:ScreenDimensions.screenWidth(context) * 0.06),
                      Expanded(
                        flex: 1,
                        child:  CustomButton(
                          text: "Yes, Confirm",
                          borderRadius: 12.0,
                          buttonColor: textColor,
                          onPressed: () async {

                          },
                        ),),
                    ],),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}