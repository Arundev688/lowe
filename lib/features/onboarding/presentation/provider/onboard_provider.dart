import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lowes/core/commonwidgets/toast.dart';
import 'package:lowes/core/constants/constants.dart';
import 'package:lowes/features/auth/presentation/provider/auth_state_provider.dart';
import 'package:lowes/features/onboarding/domain/entities/domain_onboard.dart';
import 'package:lowes/features/onboarding/domain/usecase/onboard_usecase.dart';
import 'package:lowes/features/onboarding/presentation/pages/mobile/custom_scanner.dart';
import 'package:simple_barcode_scanner/enum.dart';

class OnboardProvider extends ChangeNotifier {
  final OnboardUseCase onboardUseCase;
  final AuthStateProvider authStateProvider;

  OnboardProvider({
    required this.onboardUseCase,
    required this.authStateProvider,
  });

  String _scanResult = "";

  String get scanResult => _scanResult;

  DomainOnboard? _onboard;

  DomainOnboard? get onBoardResult => _onboard;



  Future<void> onboard(
      String type, String data, BuildContext context,String userId,String title) async {
    authStateProvider.setState(AuthState.loading);

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
         if(success.isAssociated == true){
           if(success.isSensor == true){
             showSnackBar(context, "Sensor is Already Associated try with new one");
           } else{
             showSnackBar(context, "Package is Already Associated try with new one");
           }
         } else {

         }

       }

    });
  }


  void scanNavigation(BuildContext context,String type) async{
   var res =  await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CustomBarcodeScannerPage(
            scanType: ScanType.defaultMode,
            appBarTitle: type,
          ),
        ));
      if (res is String) {
        _scanResult = res;
        notifyListeners();
      }
  }

  void clearScan(BuildContext context){
    context.go("/dashboardMobile");
    _scanResult = "";
    notifyListeners();
  }


}
