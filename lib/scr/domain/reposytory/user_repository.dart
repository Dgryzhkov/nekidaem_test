import 'package:nekidaem_test/scr/domain/api/user_provider.dart';

class UserRepository {
  UserProvider _userProvider = UserProvider();

  Future<String> getDataToken(username, password) =>
      _userProvider.getToken(username: username, password: password);
}
