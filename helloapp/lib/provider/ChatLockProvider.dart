import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helloapp/pages/screens/SecuredChats.dart';
import 'package:helloapp/provider/DbProvider.dart';
import 'package:local_auth/local_auth.dart';

class ChatLock {
  BuildContext? cntx;
  ChatLock({this.cntx});

  LocalAuthentication localAuths = LocalAuthentication();

  void authenticatePR({String? path, bool? value, String? message}) async {
    bool canCheckBiometrics = await localAuths.canCheckBiometrics;

    if (canCheckBiometrics == true) {
      List<BiometricType> availableBiometrics =
          await localAuths.getAvailableBiometrics();

      if (Platform.isAndroid) {
        if (availableBiometrics.contains(BiometricType.weak)) {
          bool didAuthenticate = await localAuths.authenticate(
              localizedReason: message!,
              options: const AuthenticationOptions(
                  useErrorDialogs: true, stickyAuth: true));

          if (path == 'chat') {
            if (didAuthenticate == true) {
              // Success
              Navigator.push(
                  cntx!,
                  MaterialPageRoute(
                      builder: (context) => const SecuredChats()));
            } else {
              SystemNavigator.pop();
            }
          } else {
            if (didAuthenticate == true) {
              // Save the authState
              DbProvider().savePrivateChatState(value!);
            }
          }
        }
      } else {
        if (availableBiometrics.contains(BiometricType.fingerprint)) {
          bool didAuthenticate =
              await localAuths.authenticate(localizedReason: message!);

          if (path == 'chat') {
            if (didAuthenticate == true) {
              // Success
              Navigator.push(
                  cntx!,
                  MaterialPageRoute(
                      builder: (context) => const SecuredChats()));
            } else {
              SystemNavigator.pop();
            }
          } else {
            if (didAuthenticate == true) {
              // Save the authState
              DbProvider().savePrivateChatState(value!);
            }
          }
        }
      }
    } else {
      // No biometrics available, do PIN authentication
    }
  }
}
