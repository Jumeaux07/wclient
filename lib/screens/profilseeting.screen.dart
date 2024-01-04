import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:w_client/components/settingItem.dart';
import 'package:w_client/config/colors.config.dart';
import 'package:w_client/controllers/auth/auth.controller.dart';
import 'package:w_client/models/client.model.dart';
import 'package:w_client/screens/auth/login.screen.dart';

class ProfilSeetingScreen extends StatefulWidget {
  const ProfilSeetingScreen({super.key, required this.clientModel});
  final ClientModel clientModel;

  @override
  State<ProfilSeetingScreen> createState() => _ProfilSeetingScreenState();
}

class _ProfilSeetingScreenState extends State<ProfilSeetingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            //Avatar
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(100),
                  image: const DecorationImage(
                      image: AssetImage("assets/images/profil-avatar.png"))),
              child: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/profil-avatar.png"),
              ),
            ),

            Text(
              "${widget.clientModel.data?.nomPrenoms}",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Developpeur full-stack",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
            ),
            //Section compte du setting
            const Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 10),
                  child: Text(
                    "Compte",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.texteDarkColor,
                        fontSize: 17),
                  ),
                ),
              ],
            ),
            const SettingItem(
              label: "Modifier mes informations",
              icon: Icon(Icons.person),
            ),
            const SettingItem(
              label: "Modifier mon mot de passe",
              icon: Icon(Icons.lock),
            ),
            //section Application du setting
            const Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 10),
                  child: Text(
                    "Application",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.texteDarkColor,
                        fontSize: 17),
                  ),
                ),
              ],
            ),
            const SettingItem(
              label: "à propos ",
              icon: Icon(Icons.warning_rounded),
            ),
            const SettingItem(
              label: "termes et conditions d'utilisation",
              icon: Icon(Icons.privacy_tip),
            ),
            InkWell(
              onTap: () {
                log("deconnecte");
                box.erase();
                AuthController().phoneTextEditinCotroller.value.text = "";
                AuthController().nomEditinCotroller.value.text = "";
                Get.offAll(() => Login());
              },
              child: const SettingItem(
                label: "Deconnexion",
                icon: Icon(Icons.logout),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
