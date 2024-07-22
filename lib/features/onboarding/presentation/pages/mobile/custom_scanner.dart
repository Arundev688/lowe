import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lowes/core/route/constant.dart';
import 'package:lowes/features/onboarding/presentation/provider/onboard_provider.dart';
import 'package:provider/provider.dart';
import 'package:simple_barcode_scanner/enum.dart';
import 'package:simple_barcode_scanner/screens/shared.dart';

export 'package:simple_barcode_scanner/simple_barcode_scanner.dart';


class CustomBarcodeScannerPage extends StatelessWidget {
  /// Barcode line color default set to #ff6666
  final String lineColor;

  /// Cancel button text while scanning
  final String cancelButtonText;

  /// Flag to show flash icon while scanning or not
  final bool isShowFlashIcon;

  /// Enter enum scanType, It can be BARCODE, QR, DEFAULT
  final ScanType scanType;

  /// AppBar Title
  final String? appBarTitle;

  /// Center Title
  final bool? centerTitle;

  final String? scanTitle;


  /// appBarTitle and centerTitle support in web and window only
  /// Remaining fields support in only mobile devices
  const CustomBarcodeScannerPage({
    super.key,
    this.lineColor = "#ff6666",
    this.cancelButtonText = "Cancel",
    this.isShowFlashIcon = false,
    this.scanType = ScanType.defaultMode,
    this.appBarTitle,
    this.centerTitle,
    this.scanTitle,
  });

  @override
  Widget build(BuildContext context) {
    final scanResultProvider = Provider.of<OnboardProvider>(context);
    return BarcodeScanner(
      lineColor: lineColor,
      cancelButtonText: cancelButtonText,
      isShowFlashIcon: isShowFlashIcon,
      scanType: scanType,
      appBarTitle: appBarTitle,
      centerTitle: centerTitle,
      onScanned: (res) {
        if(res.isNotEmpty){
          WidgetsBinding.instance.addPostFrameCallback((_) {
            scanResultProvider.setScanResult(res);
        //    context.goNamed(MyAppRouteConstants.scanResult, queryParameters: {'scanResult': res, 'scanTitle': scanTitle});
          });
        }
      },
    );
  }
}
