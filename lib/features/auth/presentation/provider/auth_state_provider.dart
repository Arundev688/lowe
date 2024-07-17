// auth_state.dart
import 'package:flutter/foundation.dart';

enum AuthState { initial, loading, success, error }

class AuthStateProvider extends ChangeNotifier {
  AuthState _state = AuthState.initial;

  AuthState get state => _state;

  void setState(AuthState newState) {
    _state = newState;
    notifyListeners();
  }

}
