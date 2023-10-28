import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helloapp/pages/auth/Login.dart';
import 'package:helloapp/provider/DbProvider.dart';
import 'package:local_auth/local_auth.dart';

class ScreenLock {
  BuildContext? ctx;
  ScreenLock({this.ctx});

  LocalAuthentication localAuth = LocalAuthentication();

  void authenticateUser({String? path, bool? value, String? message}) async {
    bool canCheckBiometrics = await localAuth.canCheckBiometrics;

    if (canCheckBiometrics == true) {
      List<BiometricType> availableBiometrics =
          await localAuth.getAvailableBiometrics();

      if (Platform.isAndroid) {
        if (availableBiometrics.contains(BiometricType.strong)) {
          bool didAuthenticate = await localAuth.authenticate(
              localizedReason: message!,
              options: const AuthenticationOptions(
                  useErrorDialogs: true, stickyAuth: true));

          if (path == 'splash') {
            if (didAuthenticate == true) {
              // Success
              Navigator.push(
                  ctx!, MaterialPageRoute(builder: (context) => const Login()));
            } else {
              SystemNavigator.pop();
            }
          } else {
            if (didAuthenticate == true) {
              // Save the authState
              DbProvider().saveAuthState(value!);
            }
          }
        }
      } else {
        if (availableBiometrics.contains(BiometricType.fingerprint)) {
          bool didAuthenticate =
              await localAuth.authenticate(localizedReason: message!);

          if (path == 'splash') {
            if (didAuthenticate == true) {
              // Success
              Navigator.push(
                  ctx!, MaterialPageRoute(builder: (context) => const Login()));
            } else {
              SystemNavigator.pop();
            }
          } else {
            if (didAuthenticate == true) {
              // Save the authState
              DbProvider().saveAuthState(value!);
            }
          }
        }
      }
    } else {
      // No biometrics available, do PIN authentication
    }
  }
}
