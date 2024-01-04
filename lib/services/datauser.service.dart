import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:w_client/config/endpoint.dart';
import 'package:w_client/utils/util.dart';

class DataUserService extends GetConnect {
  final box = GetStorage();
  Future<Response> getDataUser() async {
    final token = box.hasData("token") ? box.read("token") : null;
    return await post(ApiRout.dataUser, {}, headers: headers(token));
  }
}
