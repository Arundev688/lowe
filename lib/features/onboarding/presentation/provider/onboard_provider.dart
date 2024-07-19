import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lowes/core/commonwidgets/toast.dart';
import 'package:lowes/features/auth/presentation/provider/auth_state_provider.dart';
import 'package:lowes/features/onboarding/domain/usecase/onboard_usecase.dart';
import 'package:simple_barcode_scanner/enum.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class OnboardProvider extends ChangeNotifier {
  final OnboardUseCase onboardUseCase;
  final AuthStateProvider authStateProvider;

  OnboardProvider({
    required this.onboardUseCase,
    required this.authStateProvider,
  });

  String _scanResult = "";

  String get scanResult => _scanResult;

  Future<void> onboard(
      String type, String data, BuildContext context, String createdBy) async {
    authStateProvider.setState(AuthState.loading);
    final result =
        await onboardUseCase(OnboardParams(type:type ,data:data ,createdBy:createdBy ));
    await result.fold((failure) {
      authStateProvider.setState(AuthState.error);
      debugPrint(failure.message);
      showSnackBar(context, "Onboard Failed: ${failure.message}", true);
      notifyListeners();
    }, (success) async {
      authStateProvider.setState(AuthState.success);
      showSnackBar(context, "Login Success");
    });
  }


  void scanNavigation(BuildContext context) async{
   var res =  await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SimpleBarcodeScannerPage(
            scanType: ScanType.defaultMode,
          ),
        ));
      if (res is String) {
        _scanResult = res;
      }
  }

  void clearScan(BuildContext context){
    _scanResult = "";
    context.go('/dashboardMobile');
    notifyListeners();
  }


}
