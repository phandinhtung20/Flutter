import 'package:meta/meta.dart';

class UserRepository {
  static UserRepository _userRepository;

  static UserRepository instance() {
    if (_userRepository == null) {
      _userRepository = new UserRepository();
    }
    return _userRepository;
  }

  Future<String> authenticate({
    @required String username, @required String password}) async {
    await Future.delayed(Duration(seconds: 1));
    return 'token';
  }

  Future<void> deleteToken() async {
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    // Todo: Local storage
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}