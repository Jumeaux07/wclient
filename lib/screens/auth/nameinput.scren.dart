import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:w_client/components/appbarauth.dart';
import 'package:w_client/components/inputtext.dart';
import 'package:w_client/config/colors.config.dart';
import 'package:w_client/controllers/auth/auth.controller.dart';
import 'package:w_client/screens/home.screen.dart';

class NameScreen extends StatelessWidget {
  NameScreen({super.key});
  final AuthController _authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(Get.height * 0.4),
            child: const AppBarAuth(),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    text: "Copy Right ",
                    style: TextStyle(color: AppColors.texteColor, fontSize: 16),
                    children: <InlineSpan>[
                      TextSpan(
                          text: "WATTANDOH",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColors.accentColor))
                    ])),
          ),
          body: ListView(
            children: [
              //Formulaire
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Inputtext(
                  label: 'Nom et prénoms',
                  placeholder: 'Essis Cedric',
                  controller: _authController.nomEditinCotroller.value,
                  prefix: const Icon(Icons.phone_android_sharp),
                  pass: false,
                  keyboaedtype: TextInputType.text,
                ),
              ),
              //bouton
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: TextButton(
                      onPressed: () {
                        _authController.editClient(
                            _authController.phoneTextEditinCotroller.value.text,
                            _authController.nomEditinCotroller.value.text,
                            "");
                      },
                      style: const ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          backgroundColor:
                              MaterialStatePropertyAll(AppColors.primaryColor)),
                      child: _authController.loading.value
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text("Valider"),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
