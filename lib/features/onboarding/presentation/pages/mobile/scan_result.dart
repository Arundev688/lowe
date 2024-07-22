import 'package:flutter/material.dart';
import 'package:lowes/core/commonwidgets/button.dart';
import 'package:lowes/core/responsive/dimension.dart';
import 'package:lowes/core/theme/color.dart';
import 'package:lowes/core/theme/fonts.dart';
import 'package:lowes/features/auth/presentation/provider/auth_state_provider.dart';
import 'package:lowes/features/onboarding/presentation/provider/onboard_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScanResult extends StatefulWidget {
  final String? scanResult;
  final String? title;

  const ScanResult({super.key, this.scanResult,this.title});

  @override
  State<ScanResult> createState() => _ScanResultState();
}

class _ScanResultState extends State<ScanResult> {
  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<AuthStateProvider>(context);
    return Consumer<OnboardProvider>(builder: (ctx, provider, child) {
      return Scaffold(
        body: Center(
          child: Container(
            width: ScreenDimensions.screenWidth(context) * 0.95,
            height: ScreenDimensions.screenHeight(context) * 0.4,
            padding: const EdgeInsets.all(15),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: secondaryGray, borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Sure you want to onboard this asset?",
                    style: AppTextStyle.title),
                SizedBox(height: ScreenDimensions.screenHeight(context) * 0.06),
                Text(widget.scanResult.toString(),
                    style: AppTextStyle.subTitle),
                SizedBox(height: ScreenDimensions.screenHeight(context) * 0.06),
                authState.state == AuthState.loading
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
                                onPressed: () async {
                                  provider.clearScan(context);
                                },
                              ),
                            ),
                            SizedBox(
                                width: ScreenDimensions.screenWidth(context) *
                                    0.06),
                            Expanded(
                              flex: 1,
                              child: CustomButton(
                                text: "Yes, Confirm",
                                borderRadius: 12.0,
                                buttonColor: textColor,
                                onPressed: () async {
                                  final prefs = await SharedPreferences.getInstance();
                                  var userId = prefs.getString('userId');
                                  if (!context.mounted) return;
                                  provider.onboard("barcode",
                                      widget.scanResult.toString(), context,userId.toString(),widget.title.toString());
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
