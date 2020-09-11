import 'package:flutter_networking/user_model.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _baseURL = "https://reqres.in";

  //Post request
  Future<UserModel> postCredential(name, job) async {
    var url = _baseURL + "/api/users";
    
    http.Response response =
        await http.post(url, body: {"name": name, "job": job});

    if (response.statusCode == 201) {
      return userModelFromJson(response.body);
    }else{
      throw new Exception("An error occured");
    }
  }
}
