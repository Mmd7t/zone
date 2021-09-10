import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_zone/routes/app_pages.dart';
import 'package:top_zone/utils/shared_prefs.dart';
import 'package:top_zone/widgets/custom_progress_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      String apiToken = await SharedPrefsHelper.getApiTokenFromPrefs();

      print(apiToken);
      if (apiToken != null) {
        Get.offNamedUntil(Routes.MAIN_PAGE, (route) => false);
      } else {
        Get.offNamedUntil(Routes.ONBOARDING, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Get.theme.colorScheme.secondary,
                  Get.theme.primaryColor,
                ],
                center: Alignment.bottomLeft,
                radius: 1,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  alignment: Alignment.bottomCenter,
                  child: Image.asset('assets/logo.png'),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20)
                      .copyWith(top: 60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomProgressIndicator(),
                      Text(
                        '1.2.3',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
