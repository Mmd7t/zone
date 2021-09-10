import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:top_zone/controllers/auth_controller.dart';
import 'package:top_zone/controllers/geolocator_controller.dart';
import 'package:top_zone/models/auth_model.dart';
import 'package:top_zone/widgets/global_back_btn.dart';
import 'package:top_zone/widgets/global_btn.dart';
import 'package:top_zone/widgets/global_textfield.dart';

class SignupPage3 extends StatefulWidget {
  const SignupPage3({Key key}) : super(key: key);

  @override
  _SignupPage3State createState() => _SignupPage3State();
}

class _SignupPage3State extends State<SignupPage3> {
  final authController = Get.find<AuthController>();
  final geolocatorController = Get.find<GeolocatorController>();

  @override
  void initState() {
    super.initState();
    print(authController.name.value);
    print(authController.email.value);
    print(authController.phone.value);
    print(authController.password.value);
  }

  @override
  Widget build(BuildContext context) {
    print(geolocatorController.currentLocation.value.latitude);
    print(geolocatorController.currentLocation.value.longitude);
    return Scaffold(
      backgroundColor: Get.theme.primaryColor,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: SafeArea(
              child: Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GlobalBackBtn(),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                'عنوانك على الخريطة',
                                style: Get.textTheme.subtitle1.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: GlobalTextField.outlineBorder(
                          borderColor: Colors.black,
                          borderRadius: 15,
                          fillColor: Colors.white,
                          hint: 'ابحث',
                          suffixIcon: const Icon(Icons.search),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
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
                              zoom: 14.0,
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
          Expanded(
            flex: 1,
            child: Container(
              width: Get.mediaQuery.size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Obx(
                    () => (geolocatorController.getAddressName.value == '')
                        ? CircularProgressIndicator()
                        : Text(
                            '${geolocatorController.getAddressName.value}',
                            style: Get.textTheme.subtitle1.copyWith(
                              color: Colors.black,
                            ),
                          ),
                  ),
                  const SizedBox(height: 15),
                  GlobalBtn(
                    title: 'تسجيل',
                    onTap: () {
                      print('phoooooooooooooooooooooooooooooooone :: ' +
                          authController.phone.value.toString());
                      print('nameeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee :: ' +
                          authController.name.value.toString());
                      authController.register(RegisterModel(
                        name: authController.name.value,
                        email: authController.email.value,
                        phone: authController.phone.value,
                        password: authController.password.value,
                        file: authController.file.value,
                        len: geolocatorController
                            .currentLocation.value.longitude,
                        alt:
                            geolocatorController.currentLocation.value.latitude,
                      ));
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
