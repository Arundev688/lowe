import 'package:flutter/material.dart';
import 'package:lowes/core/commonwidgets/button.dart';
import 'package:lowes/core/commonwidgets/toast.dart';
import 'package:lowes/core/responsive/dimension.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';
import 'package:lowes/features/onboarding/presentation/provider/onboard_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScanResult extends StatefulWidget {
  final String? scanResult;
  final int? position;
  final String? title;

  const ScanResult({super.key, this.scanResult, this.position, this.title});

  @override
  State<ScanResult> createState() => _ScanResultState();
}

class _ScanResultState extends State<ScanResult> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OnboardProvider>(builder: (ctx, provider, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          elevation: 8,
          title: Text(widget.title ?? "", style: AppTextStyle.title),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: primary),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Container(
            width: ScreenDimensions.screenWidth(context) * 0.98,
            height: ScreenDimensions.screenHeight(context) * 0.8,
            padding: const EdgeInsets.all(15),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: secondaryGray, borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.position == 3
                    ? Column(
                        children: [
                          Text("Package Info  : ${provider.packageData}"),
                          SizedBox(
                              height: ScreenDimensions.screenHeight(context) *
                                  0.03),
                          Text("Sensor Info : ${provider.sensorData}"),
                          SizedBox(
                              height: ScreenDimensions.screenHeight(context) *
                                  0.06),
                        ],
                      )
                    : const SizedBox(),
                provider.isAssociation
                    ? association(provider, context)
                    : onboard(provider, context, widget.position ?? 0)
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget onboard(OnboardProvider provider, BuildContext context, int position) {
    return Column(
      children: [
        Text(widget.title.toString(), style: AppTextStyle.title),
        SizedBox(height: ScreenDimensions.screenHeight(context) * 0.06),
        Text(provider.scanResult, style: AppTextStyle.subTitle),
        SizedBox(height: ScreenDimensions.screenHeight(context) * 0.06),
        provider.isAssociationLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomButton(
                        text: "No, cancel",
                        borderRadius: 12.0,
                        buttonColor: white,
                        textStyle: AppTextStyle.textPrime,
                        onPressed: () {
                          Navigator.pop(context);
                          provider.clearScan();
                        },
                      ),
                    ),
                    SizedBox(
                        width: ScreenDimensions.screenWidth(context) * 0.06),
                    Expanded(
                      flex: 1,
                      child: CustomButton(
                        text: "Yes, Confirm",
                        borderRadius: 12.0,
                        buttonColor:
                            provider.scanResult.isEmpty ? lightText : textColor,
                        onPressed: provider.scanResult.isEmpty
                            ? () {
                                showSnackBar(context,
                                    "Invalid Scan Result Try Again", true);
                              }
                            : () async {
                                final prefs =
                                    await SharedPreferences.getInstance();
                                var userId = prefs.getString('userId');
                                if (!context.mounted) return;

                                //position 0 means package so we are calling the onboard package
                                if (position == 0) {
                                  provider.onboardPackage(
                                      "barcode",
                                      provider.scanResult,
                                      context,
                                      userId ?? "66911c4e29c65e045b96d765");
                                } else {

                                }

                           /*     if (provider.sensorData.toString().isNotEmpty ||
                                    provider.packageData
                                        .toString()
                                        .isNotEmpty) {
                                  provider.onboard(
                                      "barcode",
                                      provider.scanResult,
                                      context,
                                      userId.toString(),
                                      widget.position.toString(),
                                      2);
                                } else {
                                  provider.onboard(
                                      "barcode",
                                      provider.scanResult,
                                      context,
                                      userId.toString(),
                                      widget.position.toString(),
                                      1);
                                }*/
                              },
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }

  Widget association(OnboardProvider provider, BuildContext context) {
    return Column(
      children: [
        Text("Sure you want to associate?", style: AppTextStyle.title),
        SizedBox(height: ScreenDimensions.screenHeight(context) * 0.06),
        provider.isOnboarding
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomButton(
                        text: "Cancel",
                        borderRadius: 12.0,
                        buttonColor: white,
                        textStyle: AppTextStyle.textPrime,
                        onPressed: () {
                          Navigator.pop(context);
                          provider.clearScan();
                        },
                      ),
                    ),
                    SizedBox(
                        width: ScreenDimensions.screenWidth(context) * 0.04),
                    Expanded(
                      flex: 1,
                      child: CustomButton(
                        text: "Associate",
                        borderRadius: 12.0,
                        buttonColor: textColor,
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          var userId = prefs.getString('userId');
                          if (!context.mounted) return;
                          provider.association(
                              provider.packageData,
                              "barcode",
                              provider.sensorData,
                              "qr_code",
                              userId.toString(),
                              context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
