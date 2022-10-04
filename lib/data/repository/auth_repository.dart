import 'package:bridy_go_user/data/web_serves/auth_web_server.dart';

import '../models/user.dart';

class AuthRepository {
  final AuthWebServer _authWebServer;

  AuthRepository(this._authWebServer);

  Future<User?> login(User user) async {
    final data = await _authWebServer.login(user);

    if (data['success']) {
      return User.fromJson(data);
    }
    return null;
  }
  Future<User?> verify (String email,String code) async {
    final data = await _authWebServer.verify(email,code);
    if (data['success']) {
      return User.fromJson(data);
    }
    return null;

  }
  Future register(User user) async {
    final data = await _authWebServer.register(user);
    if (data['success']) {
      return data['success'];
    }
    return data['message'];
  }

  Future<User?> getUserData(String token) async {
    final response = await _authWebServer.getUserData(token);
      final data = response;
      return User.fromJson(data);

  }
}
