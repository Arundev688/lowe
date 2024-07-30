import 'package:flutter/material.dart';
import 'package:lowes/core/responsive/dimension.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';
import 'package:lowes/features/onboarding/presentation/widgets/elevation_container.dart';

class BottomModalSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 5,
            width: 52,
            color: Colors.black,
            margin: EdgeInsets.only(bottom: 10)),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            width: double.infinity,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: (){
                         Navigator.pop(context);
                    },
                    icon: Icon(Icons.close),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child:customContainer(
                            containerColor: primaryLight,
                            radius: 12,
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/png/package.png",
                                  fit: BoxFit.contain,
                                  width: ScreenDimensions.screenWidth(context) * 0.25,
                                  height: ScreenDimensions.screenHeight(context) * 0.1,
                                ),
                                Center(child: Text("Title", style: AppTextStyle.content,textAlign: TextAlign.center,))
                              ],
                            )
                        ), ),
                    Expanded(
                      flex: 1,
                      child:customContainer(
                          containerColor: primaryLight,
                          radius: 12,
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/png/package.png",
                                fit: BoxFit.contain,
                                width: ScreenDimensions.screenWidth(context) * 0.25,
                                height: ScreenDimensions.screenHeight(context) * 0.1,
                              ),
                              Center(child: Text("Title", style: AppTextStyle.content,textAlign: TextAlign.center,))
                            ],
                          )
                      ), ),
                    Expanded(
                      flex: 1,
                      child:customContainer(
                          containerColor: primaryLight,
                          radius: 12,
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/png/package.png",
                                fit: BoxFit.contain,
                                width: ScreenDimensions.screenWidth(context) * 0.25,
                                height: ScreenDimensions.screenHeight(context) * 0.1,
                              ),
                              Center(child: Text("Title", style: AppTextStyle.content,textAlign: TextAlign.center,))
                            ],
                          )
                      ), ),

                  ],
                ),
                 SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child:customContainer(
                          containerColor: primaryLight,
                          radius: 12,
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/png/package.png",
                                fit: BoxFit.contain,
                                width: ScreenDimensions.screenWidth(context) * 0.25,
                                height: ScreenDimensions.screenHeight(context) * 0.1,
                              ),
                              Center(child: Text("Title", style: AppTextStyle.content,textAlign: TextAlign.center,))
                            ],
                          )
                      ), ),
                    Expanded(
                      flex: 1,
                      child:customContainer(
                          containerColor: primaryLight,
                          radius: 12,
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/png/package.png",
                                fit: BoxFit.contain,
                                width: ScreenDimensions.screenWidth(context) * 0.25,
                                height: ScreenDimensions.screenHeight(context) * 0.1,
                              ),
                              Center(child: Text("Title", style: AppTextStyle.content,textAlign: TextAlign.center,))
                            ],
                          )
                      ), ),
                    Expanded(
                      flex: 1,
                      child:customContainer(
                          containerColor: primaryLight,
                          radius: 12,
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/png/package.png",
                                fit: BoxFit.contain,
                                width: ScreenDimensions.screenWidth(context) * 0.25,
                                height: ScreenDimensions.screenHeight(context) * 0.1,
                              ),
                              Center(child: Text("Title", style: AppTextStyle.content,textAlign: TextAlign.center,))
                            ],
                          )
                      ), ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}