import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lowes/core/commonwidgets/toast.dart';
import 'package:lowes/core/constants/constants.dart';
import 'package:lowes/core/error/exceptions.dart';
import 'package:lowes/features/auth/presentation/provider/auth_state_provider.dart';
import 'package:lowes/features/onboarding/domain/entities/domain_onboard.dart';
import 'package:lowes/features/onboarding/domain/usecase/association_usecase.dart';
import 'package:lowes/features/onboarding/domain/usecase/onboard_usecase.dart';
import 'package:lowes/features/onboarding/presentation/pages/mobile/custom_scanner.dart';

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

  bool _isAssociation = false;

  bool get isAssociation => _isAssociation;

  DomainOnboard? _onboard;

  DomainOnboard? get onBoardResult => _onboard;

  Future<void> onboard(
      String type, String data, BuildContext context,String userId,String title,int count) async {
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
         _isAssociation = false;
         context.go("/dashboardMobile");
         showSnackBar(context, "Onboard Success");
         setScanResult("");
         notifyListeners();
       } else {
         authStateProvider.setState(AuthState.success);
         setScanResult("");
         if(success.isAssociated == true){
           if(success.isSensor == true){
             showSnackBar(context, "Sensor is Already Associated try with new one",true);
           } else{
             showSnackBar(context, "Package is Already Associated try with new one",true);
           }
           context.go("/dashboardMobile");
           notifyListeners();
         } else {
           if (count < 2) {
             _isAssociation = false;
             scanBarcode(context);
             notifyListeners();
           } else {
             _isAssociation = true;
             notifyListeners();
           }

           if (success.isSensor == true) {
             _sensorDate = data;
           } else {
             _packageData = data;
           }
           notifyListeners();
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

    try{
      final result =
      await associationUseCase(AssociationParams(
          packageData, packageType, sensorData, sensorType, createdBy));
      result.fold((failure) {
        authStateProvider.setState(AuthState.error);
        showSnackBar(context, "Association Failed: ${failure.message}", true);
        clearScan();
        context.go("/dashboardMobile");
        notifyListeners();
      },(success){
        authStateProvider.setState(AuthState.success);
        clearScan();
        context.go("/dashboardMobile");
        showSnackBar(context, "Association Success");
        notifyListeners();
      });
    } on ServerExceptions catch (e) {
       showSnackBar(context, e.message, true);
    }
  }

  void setScanResult(String result) {
    _scanResult = result;
    notifyListeners();
  }


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


  void clearScan(){
    _scanResult = "";
    _sensorDate = "";
    _packageData= "";
    notifyListeners();
  }


}
