import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_zone/controllers/profile_controller.dart';
import 'package:top_zone/widgets/appBtn.dart';
import 'package:top_zone/widgets/custom_app_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:top_zone/widgets/custom_text_field.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final profileController = Get.find<ProfileController>();
  final userNameController = TextEditingController();
  final shopOwnerController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  double lat;
  double long;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar:
              customShopAppBar(context, title: "تعديل الحساب", withBack: true),
          body: ListView(
            padding: const EdgeInsets.all(16.0),
            shrinkWrap: true,
            children: [
              const SizedBox(height: 50),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 2, color: Colors.black),
                        color: Color(0xFF0097FE),
                      ),
                      height: 100,
                      width: 100,
                      child: SvgPicture.asset(
                        "assets/svg/setting.svg",
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              CustomTextField(
                controller: userNameController,
                hint: "اسم المتجر",
                keyboardType: TextInputType.name,
                prefixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 16),
              CustomTextField(
                controller: shopOwnerController,
                hint: "اسم مالك المتجر",
                keyboardType: TextInputType.name,
                prefixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 16),
              CustomTextField(
                controller: emailController,
                hint: "البريد الالكتروني",
                keyboardType: TextInputType.name,
                prefixIcon: Icon(Icons.email_outlined),
              ),
              SizedBox(height: 16),
              CustomTextField(
                controller: addressController,
                hint: "العنوان",
                keyboardType: TextInputType.name,
                prefixIcon: Icon(Icons.location_city_sharp),
              ),
              SizedBox(height: 16),
              SizedBox(height: 60),
              BtnApp(
                title: "حفظ",
                onTap: () async {
                  profileController.name.value = userNameController.text;
                  profileController.email.value = emailController.text;
                  profileController.ownerName.value = shopOwnerController.text;
                  profileController.vendorEditProfile();
                },
              )
            ],
          ),
        ));
  }
}
