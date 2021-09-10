import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:top_zone/controllers/static_controller.dart';
import 'package:top_zone/widgets/global_back_btn.dart';

class StaticPage extends StatelessWidget {
  StaticPage({Key key}) : super(key: key);
  final staticController = Get.find<StaticController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'من نحن',
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: const GlobalBackBtn(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            color: Colors.black,
            icon: const Icon(CupertinoIcons.bell),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    "assets/shrot.png",
                    height: 80,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Obx(
                () => (staticController.aboutUsLoading.value)
                    ? Center(
                        child: SpinKitThreeBounce(
                          duration: const Duration(milliseconds: 1200),
                          color: Get.theme.colorScheme.secondary,
                          size: 25,
                        ),
                      )
                    : Html(data: staticController.aboutUsDatum[0].description),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
