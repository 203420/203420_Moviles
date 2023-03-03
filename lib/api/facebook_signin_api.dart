import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookSignInApi {
  static Map<String, dynamic>? _userData;
  static AccessToken? _accessToken;

  static Future<Map<String, dynamic>> loginFb() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login(); 
      if (result.status == LoginStatus.success) {
        _accessToken = result.accessToken;
        final userData = await FacebookAuth.instance.getUserData();
        _userData = userData;
      } else {
        print(result.status);
        print(result.message);
      }
    } catch (e) {
      print(e);
    }
    return _userData!;
  }

  static Future<void> logOutFb() async {
    await FacebookAuth.instance.logOut();
    _accessToken = null;
    _userData = null;
  }
}