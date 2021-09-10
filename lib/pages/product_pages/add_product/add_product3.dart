import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:top_zone/controllers/products_controller.dart';
import 'package:top_zone/widgets/global_back_btn.dart';
import 'package:top_zone/widgets/global_btn.dart';
import 'package:top_zone/widgets/global_textfield.dart';

class AddProduct3 extends StatefulWidget {
  const AddProduct3({Key key}) : super(key: key);

  @override
  _AddProduct3State createState() => _AddProduct3State();
}

class _AddProduct3State extends State<AddProduct3> {
  final productsController = Get.find<ProductsController>();

  TextEditingController detailsController = TextEditingController();

  File _image;
  ImageSource source = ImageSource.gallery;

/*-----------------------------------  Get The Image Function  -----------------------------------*/
  Future getImage() async {
    final pickedFile = await ImagePicker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

/*-----------------------------------  Get Source Function  -----------------------------------*/
// function the shows dialog to choose which source would you get the image from
// ImageSource.camera ----OR---- ImageSource.gallery
  _getSource(context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Choose Source'),
          actions: [
            /*------------------------  ImageSource.camera Btn  ------------------------*/
            TextButton(
              onPressed: () {
                setState(() {
                  source = ImageSource.camera;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Camera'),
            ),
            /*------------------------  ImageSource.gallery Btn  ------------------------*/
            TextButton(
              onPressed: () {
                setState(() {
                  source = ImageSource.gallery;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Gallery'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'اضافة منتج',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GlobalBackBtn(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            color: Colors.black,
            icon: Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 15),
              Container(
                width: Get.mediaQuery.size.width * 0.9,
                child: GlobalTextField.outlineBorder(
                  controller: detailsController,
                  borderColor: Colors.black,
                  borderRadius: 15,
                  fillColor: Colors.white,
                  hint: 'وصف المنتج',
                  maxLines: 5,
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 15),
                        Text(
                          (_image != null)
                              ? '${_image.path}'
                              : 'صورة توضيحية للوصف',
                          style: TextStyle(color: Colors.black),
                        ),
                        Spacer(),
                        Container(
                          child: MaterialButton(
                            onPressed: () async {
                              await _getSource(context);
                              getImage();
                            },
                            child: Text('ارفاق'),
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            color: Get.theme.colorScheme.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => (productsController.addProductLoading.value)
                    ? SpinKitThreeBounce(
                        duration: const Duration(milliseconds: 1200),
                        color: Get.theme.colorScheme.secondary,
                        size: 25,
                      )
                    : GlobalBtn(
                        title: 'اعلان المنتج',
                        onTap: () async {
                          productsController.details.value =
                              detailsController.text;

                          await productsController.addProduct();
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
