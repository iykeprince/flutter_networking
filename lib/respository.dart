import 'api.dart';
import 'user_model.dart';

class Respository {

  Future<UserModel> postUser(name, job) async {
    UserModel user = await Api().postCredential(name, job);

    return user;
  }
}