import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:top_zone/controllers/geolocator_controller.dart';
import 'package:top_zone/controllers/profile_controller.dart';
import 'package:top_zone/widgets/appBtn.dart';
import 'package:top_zone/widgets/custom_app_bar.dart';
import 'package:top_zone/widgets/custom_text_field.dart';
import 'package:top_zone/widgets/image_picker_sheet%20copy.dart';

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
  final phoneController = TextEditingController();
  final geolocatorController = Get.find<GeolocatorController>();
  File file;
  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    shopOwnerController.dispose();
    addressController.dispose();
    emailController.dispose();
    phoneController.dispose();
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
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: Get.size.width * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black, width: 2),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: (file == null)
                          ? Image.asset(
                              "assets/error.png",
                            )
                          : Image.file(file),
                    ),
                  ),
                  Positioned(
                    bottom: -12,
                    right: -12,
                    child: GestureDetector(
                      onTap: () {
                        ImagePickerDialog().show(
                            context: context,
                            onGet: (f) {
                              setState(() {
                                file = f;
                              });
                            });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        child: Icon(Icons.edit),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.black, width: 2),
                          color: Colors.white,
                        ),
                      ),
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
            Obx(
              () => (geolocatorController.getAddressName.value == '')
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black, width: 1),
                        color: Colors.white,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'اختر العنوان',
                        style: Get.textTheme.subtitle1.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black, width: 1),
                        color: Colors.white,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${geolocatorController.getAddressName.value}',
                        style: Get.textTheme.subtitle1.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 350,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => (geolocatorController.currentLocation == null)
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                          child: Container(
                            width: Get.mediaQuery.size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: GoogleMap(
                              mapToolbarEnabled: true,
                              zoomGesturesEnabled: true,
                              onTap: (latlng) {
                                geolocatorController.setManualLocation(latlng);
                              },
                              initialCameraPosition: CameraPosition(
                                target: LatLng(
                                    geolocatorController
                                        .currentLocation.value.latitude,
                                    geolocatorController
                                        .currentLocation.value.longitude),
                                zoom: 4.0,
                              ),
                              mapType: MapType.normal,
                              markers: {
                                Marker(
                                  draggable: true,
                                  position: LatLng(
                                      geolocatorController
                                          .currentLocation.value.latitude,
                                      geolocatorController
                                          .currentLocation.value.longitude),
                                  markerId: MarkerId('ay 7aga'),
                                  icon: BitmapDescriptor.defaultMarkerWithHue(
                                      BitmapDescriptor.hueOrange),
                                ),
                              },
                            ),
                          ),
                        ),
                ),
              ),
            ),
            SizedBox(height: 16),
            profileController.editProfileLoading.value
                ? Center(child: CircularProgressIndicator())
                : BtnApp(
                    title: "حفظ",
                    onTap: () async {
                      profileController.name.value = userNameController.text;
                      profileController.email.value = emailController.text;
                      profileController.ownerName.value =
                          shopOwnerController.text;
                      profileController.image.value = file;

                      profileController.lat.value = geolocatorController
                          .currentLocation.value.latitude
                          .toDouble();
                      profileController.long.value = geolocatorController
                          .currentLocation.value.longitude
                          .toDouble();
                      profileController.vendorEditProfile();
                    },
                  )
          ],
        ),
      ),
    );
  }
}
