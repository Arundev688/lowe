import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lowes/core/commonwidgets/toast.dart';
import 'package:lowes/core/constants/constants.dart';
import 'package:lowes/core/route/constant.dart';
import 'package:lowes/features/auth/presentation/provider/auth_state_provider.dart';
import 'package:lowes/features/onboarding/domain/entities/domain_onboard.dart';
import 'package:lowes/features/onboarding/domain/usecase/association_usecase.dart';
import 'package:lowes/features/onboarding/domain/usecase/onboard_usecase.dart';
import 'package:lowes/features/onboarding/presentation/pages/mobile/custom_scanner.dart';
import 'package:simple_barcode_scanner/enum.dart';

class OnboardProvider extends ChangeNotifier {
  final OnboardUseCase onboardUseCase;
  final AuthStateProvider authStateProvider;
  final AssociationUseCase associationUseCase;

  OnboardProvider({
    required this.onboardUseCase,
    required this.authStateProvider,
    required this.associationUseCase
  });

  String _scanResult ='';

  String _sensorDate = "";
  String _packageData = "";

  String get scanResult => _scanResult;

  String get sensorData => _sensorDate;

  String get packageData => _packageData;

  DomainOnboard? _onboard;

  DomainOnboard? get onBoardResult => _onboard;

  Future<void> onboard(
      String type, String data, BuildContext context,String userId,String title) async {
    authStateProvider.setState(AuthState.loading);
    notifyListeners();

    final result =
        await onboardUseCase(OnboardParams(type:type ,data:data ,createdBy:userId.toString()));
     result.fold((failure) {
      authStateProvider.setState(AuthState.error);
      showSnackBar(context, "Onboard Failed: ${failure.message}", true);
      notifyListeners();
    }, (success) {
       if(title == Constants.scanOnboard){
         authStateProvider.setState(AuthState.success);
         _onboard = success;
         context.go("/dashboardMobile");
         showSnackBar(context, "Onboard Success");
         notifyListeners();
       } else {
         authStateProvider.setState(AuthState.success);
         if(success.isAssociated == true){
           if(success.isSensor == true){
             showSnackBar(context, "Sensor is Already Associated try with new one");
           } else{
             showSnackBar(context, "Package is Already Associated try with new one");
           }
           context.go("/dashboardMobile");
         } else {
           scanBarcode(context);
          if(success.isSensor == true){
            _sensorDate = data;
          } else {
            _packageData = data;
          }
         }
       }
    });
  }

  Future<void> association(String packageData,
      String packageType,
      String sensorData,
      String sensorType,
      String createdBy,BuildContext context) async{
    authStateProvider.setState(AuthState.loading);
    notifyListeners();

    final result =
        await associationUseCase(AssociationParams(
        packageData, packageType, sensorData, sensorType, createdBy));
    result.fold((failure) {
      authStateProvider.setState(AuthState.error);
      showSnackBar(context, "Association Failed: ${failure.message}", true);
      _sensorDate = "";
      _packageData = "";
      notifyListeners();
    },(success){
      authStateProvider.setState(AuthState.success);
      _sensorDate = "";
      _packageData = "";
      context.go("/dashboardMobile");
      showSnackBar(context, "Association Success");
      notifyListeners();
    });

  }

  void setScanResult(String result) {
    _scanResult = result;
    notifyListeners();
  }


 /* void scanNavigation(BuildContext context, String type) async {
    var res = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CustomBarcodeScannerPage(
          scanType: ScanType.defaultMode,
          scanTitle: type,
        ),
      ),
    );
    if (res is String) {
      _scanResult = res;
      notifyListeners();
      // Delaying navigation to ensure the widget is not disposed
      Future.microtask(() => context.goNamed(MyAppRouteConstants.scanResult, queryParameters: {'scanResult': res, 'scanTitle': type}));
    }
  }*/
  Future<String?> scanBarcode(BuildContext context) async {
    try{
      final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SimpleBarcodeScannerPage(),
        ),
      );
      if (result != null) {
        setScanResult(result);
      }
      return result;
    }catch(e){
      return e.toString();
    }

  }


  void clearScan(BuildContext context){
    context.go("/dashboardMobile");
    _scanResult = "";
    _sensorDate = "";
    _packageData= "";
    notifyListeners();
  }


}
