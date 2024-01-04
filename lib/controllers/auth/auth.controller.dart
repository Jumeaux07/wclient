import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:w_client/models/client.model.dart';
import 'package:w_client/screens/auth/nameinput.scren.dart';
import 'package:w_client/screens/home.screen.dart';
import 'package:w_client/services/datauser.service.dart';
import 'package:w_client/services/login.service.dart';

class AuthController extends GetxController {
  final phoneTextEditinCotroller = TextEditingController().obs;
  final nomEditinCotroller = TextEditingController().obs;
  GetStorage box = GetStorage();
  RxBool loading = RxBool(false);
  final clientModel = ClientModel().obs;

  Future<void> loginorsave({required phone}) async {
    try {
      loading.value = true;
      final response = await LoginSerice().login(phone: phone);
      if (response.statusCode == 200) {
        box.write("token", response.body["data"]['token']);
        if (response.body["data"]['client']['nom_prenoms'] == null) {
          Get.off(() => NameScreen());
          loading.value = false;
        } else {
          Get.offAll(() => HomeScreen(
                currentIndex: 0,
              ));
          loading.value = false;
        }
        log("Token => ${box.read("token")}");
        log("name => ${response.body["data"]['client']['nom_prenoms']}");
      } else {
        log("Erreur login");
      }
    } catch (e) {
      log("Exception login => ${e.toString()}");
    }
  }

  Future<void> editClient(
    String phone,
    String nomprenoms,
    String phone2,
  ) async {
    try {
      loading.value = true;
      final response = await LoginSerice().editUser(phone, nomprenoms, phone2);
      if (response.statusCode == 200) {
        clientModel.value = ClientModel.fromJson(response.body);
        Get.off(() => HomeScreen(
              currentIndex: 0,
            ));
        loading.value = false;
        log("Client => ${response.body}");
      } else {
        log("Erreur edit profil");
        loading.value = false;
      }
    } catch (e) {
      log("Exception edit prfil => $e");
      loading.value = false;
    }
  }

  Future<void> getDataUser() async {
    final response = await DataUserService().getDataUser();
    if (response.statusCode == 200) {
      clientModel.value = ClientModel.fromJson(response.body);
      log("Client => ${response.body}");
    } else {
      log("Erreur datauser ${response.body}");
    }
  }
}
