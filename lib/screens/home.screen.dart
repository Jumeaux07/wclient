import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:w_client/config/colors.config.dart';
import 'package:w_client/controllers/auth/auth.controller.dart';
import 'package:w_client/screens/profilseeting.screen.dart';
import 'package:w_client/screens/publication/listepublication.screen.dart';
import 'package:w_client/screens/rendez-vous/listerendezvous.screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.currentIndex});

  int currentIndex;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  final AuthController _authController = Get.put(AuthController());

  @override
  void initState() {
    _authController.getDataUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          bottomNavigationBar: Card(
            child: SalomonBottomBar(
                currentIndex: widget.currentIndex,
                onTap: (i) {
                  setState(() {
                    widget.currentIndex = i;
                    pageController.animateToPage(i,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                  });
                },
                items: [
                  SalomonBottomBarItem(
                      icon: const Icon(Icons.newspaper_rounded),
                      title: const Text("Home")),
                  // SalomonBottomBarItem(
                  //     icon: const Icon(Icons.edit_note_outlined),
                  //     title: const Text("Publier")),
                  SalomonBottomBarItem(
                      icon: const Icon(Icons.calendar_month_outlined),
                      title: const Text("RDV")),
                  SalomonBottomBarItem(
                      icon: const Icon(Icons.settings),
                      title: const Text("Profil")),
                ]),
          ),
          body: PageView(
            controller: pageController,
            onPageChanged: (int index) {
              setState(() {
                widget.currentIndex = index;
              });
            },
            children: [
              const ListePublication(),
              // PublicationFormScreen(),
              const ListeRendezvousScreen(),
              ProfilSeetingScreen(
                clientModel: _authController.clientModel.value,
              ),
            ],
          ),
        ));
  }
}
