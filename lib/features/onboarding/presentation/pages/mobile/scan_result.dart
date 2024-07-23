import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lowes/core/commonwidgets/button.dart';
import 'package:lowes/core/constants/constants.dart';
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

  const ScanResult({super.key, this.scanResult, this.title});

  @override
  State<ScanResult> createState() => _ScanResultState();
}

class _ScanResultState extends State<ScanResult> {
  bool _isAssociation = false;

  @override
  void initState() {
    if (widget.title == Constants.scanAssociate) {
      setState(() {
        _isAssociation = true;
      });
    } else {
      setState(() {
        _isAssociation = false;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<AuthStateProvider>(context);
    return Consumer<OnboardProvider>(builder: (ctx, provider, child) {
      return Scaffold(
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
                _isAssociation
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
                    ? association(provider, authState,context)
                    : onboard(provider, authState,context)
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget onboard(OnboardProvider provider, AuthStateProvider authState,BuildContext context) {
    return Column(
      children: [
        Text(widget.title.toString(), style: AppTextStyle.title),
        SizedBox(height: ScreenDimensions.screenHeight(context) * 0.06),
        Text(provider.scanResult, style: AppTextStyle.subTitle),
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
                        onPressed: () {
                          context.go("/dashboardMobile");
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
                        buttonColor: textColor,
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          var userId = prefs.getString('userId');
                          if (!context.mounted) return;
                          if(provider.sensorData.toString().isNotEmpty || provider.packageData.toString().isNotEmpty){
                            provider.onboard("barcode", provider.scanResult, context, userId.toString(), widget.title.toString(),2);
                          } else {
                            provider.onboard("barcode", provider.scanResult, context, userId.toString(), widget.title.toString(),1);
                          }

                        },
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }

  Widget association(OnboardProvider provider, AuthStateProvider authState,BuildContext context) {
    return Column(
      children: [
        Text("Sure you want to associate?", style: AppTextStyle.title),
        SizedBox(height: ScreenDimensions.screenHeight(context) * 0.06),
        Text(widget.scanResult.toString(), style: AppTextStyle.subTitle),
        SizedBox(height: ScreenDimensions.screenHeight(context) * 0.06),
        authState.state == AuthState.loading
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
                        onPressed: (){
                          context.go("/dashboardMobile");
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
