import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:w_client/config/endpoint.dart';
import 'package:w_client/utils/util.dart';

class LoginSerice extends GetConnect {
  final box = GetStorage();
  //login
  Future<Response> login({required String phone}) async {
    final token = box.hasData("token") ? box.read("token") : null;
    return await post(ApiRout.loginorsaveuser, {"phone1": phone},
        headers: headers(token));
  }

  Future<Response> editUser(
    String phone,
    String nomPrenoms,
    String phone2,
  ) async {
    final token = box.hasData("token") ? box.read("token") : null;
    return await post(
        ApiRout.editUser,
        {
          "phone1": phone,
          "nom_prenoms": nomPrenoms,
          "phone2": phone2,
        },
        headers: headers(token));
  }
}
