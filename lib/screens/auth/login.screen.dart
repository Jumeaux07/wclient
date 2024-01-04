import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:w_client/components/appbarauth.dart';
import 'package:w_client/components/inputtext.dart';
import 'package:w_client/config/colors.config.dart';
import 'package:w_client/controllers/auth/auth.controller.dart';
import 'package:w_client/screens/home.screen.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final authController = Get.put(AuthController());
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
                  length: 10,
                  label: 'Téléphone',
                  placeholder: '0103772742',
                  controller: authController.phoneTextEditinCotroller.value,
                  prefix: const Icon(Icons.phone_android_sharp),
                  pass: false,
                  keyboaedtype: TextInputType.phone,
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
                        authController.loginorsave(
                            phone: authController
                                .phoneTextEditinCotroller.value.text);
                      },
                      style: const ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          backgroundColor:
                              MaterialStatePropertyAll(AppColors.primaryColor)),
                      child: authController.loading.value
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Text("Valider"),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
