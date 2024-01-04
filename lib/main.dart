import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:w_client/config/colors.config.dart';
import 'package:w_client/controllers/auth/auth.controller.dart';
import 'package:w_client/screens/auth/login.screen.dart';
import 'package:w_client/screens/home.screen.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GetStorage box = GetStorage();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final AuthController _authController = Get.put(AuthController());
    return GetMaterialApp(
      title: 'W_client',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      home: box.hasData("token")
          ? HomeScreen(
              currentIndex: 0,
            )
          : Login(),
    );
  }
}
