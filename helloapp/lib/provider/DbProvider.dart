import 'package:shared_preferences/shared_preferences.dart';

class DbProvider {
  // Obtain shared preferences.
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

//for Auth settings
  void saveAuthState(bool status) async {
    final instance = await prefs;

    instance.setBool('status', status);
  }

  //Read
  Future<bool> getAuthState() async {
    final instance = await prefs;

    if (instance.containsKey('status')) {
      final value = instance.getBool('status');

      return value!;
    } else {
      return false;
    }
  }

  void savePrivateChatState(bool chat) async {
    final instance = await prefs;

    instance.setBool('chat', chat);
  }

  Future<bool> getPrivateChatState() async {
    final instance = await prefs;

    if (instance.containsKey('chat')) {
      final value = instance.getBool('chat');

      return value!;
    } else {
      return false;
    }
  }
}
