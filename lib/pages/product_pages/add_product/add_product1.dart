import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:top_zone/controllers/products_controller.dart';
import 'package:top_zone/models/assets_model.dart';
import 'package:top_zone/models/brands_model.dart';
import 'package:top_zone/models/categories_model.dart';
import 'package:top_zone/routes/app_pages.dart';
import 'package:top_zone/widgets/btn_field.dart';
import 'package:top_zone/widgets/custom_dialogs.dart';
import 'package:top_zone/widgets/global_back_btn.dart';
import 'package:top_zone/widgets/global_btn.dart';
import 'package:top_zone/widgets/global_textfield.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:top_zone/widgets/image_picker_sheet.dart';

class AddProduct1 extends StatefulWidget {
  @override
  _AddProduct1State createState() => _AddProduct1State();
}

class _AddProduct1State extends State<AddProduct1> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final productsController = Get.find<ProductsController>();
  TextEditingController controller = TextEditingController();
  final List years = List.generate(23, (index) => index + 2000);

  String brand = "اختر نوع السياره";
  String asset = "اختر فئة السياره";
  String model = "اختر موديل السياره";
  String category = "أختر قسم السياره";

  List<Asset> images = <Asset>[];
  List<File> fileImageArray = [];
  Future convertImagesToFiles() async {
    images.forEach((imageAsset) async {
      final filePath =
          await FlutterAbsolutePath.getAbsolutePath(imageAsset.identifier);

      File tempFile = File(filePath);
      if (tempFile.existsSync()) {
        fileImageArray.add(tempFile);
      }
    });
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 8, // you can select maximum images from here
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#2896DB",
          actionBarTitle: "Zone",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#2978b5",
        ),
      );
    } on Exception catch (e) {
      throw e;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'اضافة منتج',
          style: const TextStyle(color: Colors.black),
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
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 15),
              BtnField(
                title: category,
                onTap: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25)),
                    ),
                    context: context,
                    builder: (context) => Container(
                      padding: const EdgeInsets.all(15),
                      width: double.infinity,
                      height: Get.mediaQuery.size.height * 0.5,
                      child: FutureBuilder<CategoriesModel>(
                        future: productsController.getProductCategories(),
                        builder: (context, snapshot) {
                          return (snapshot.hasData)
                              ? ListView.builder(
                                  itemCount: snapshot.data.data.length,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    onTap: () {
                                      productsController.category.value =
                                          snapshot.data.data[index].id;
                                      setState(() {
                                        category =
                                            snapshot.data.data[index].name;
                                      });
                                      Navigator.of(context).pop();
                                      customSnackBar(
                                          'تم اختيار قسم السياره بنجاح',
                                          CupertinoIcons.checkmark_seal);
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(26.0),
                                        child: Text(
                                          '${snapshot.data.data[index].name}',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Center(
                                  child: SpinKitThreeBounce(
                                    duration:
                                        const Duration(milliseconds: 1200),
                                    color: Get.theme.colorScheme.secondary,
                                    size: 25,
                                  ),
                                );
                        },
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 15),
              BtnField(
                title: brand,
                onTap: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25)),
                    ),
                    context: context,
                    builder: (context) => Container(
                      padding: const EdgeInsets.all(15),
                      width: double.infinity,
                      height: Get.mediaQuery.size.height * 0.5,
                      child: FutureBuilder<List<BrandsModel>>(
                          future: productsController.getProductbrands(),
                          builder: (context, snapshot) {
                            return (snapshot.hasData)
                                ? ListView.builder(
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                      onTap: () {
                                        productsController.brand.value =
                                            snapshot.data[index].id;
                                        productsController.brandId.value =
                                            snapshot.data[index].id;
                                        setState(() {
                                          brand = snapshot.data[index].name;
                                        });
                                        Navigator.of(context).pop();
                                        customSnackBar(
                                            'تم اختيار نوع السياره بنجاح',
                                            CupertinoIcons.checkmark_seal);
                                      },
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(26),
                                          child: Text(
                                            '${snapshot.data[index].name}',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Center(
                                    child: SpinKitThreeBounce(
                                    duration:
                                        const Duration(milliseconds: 1200),
                                    color: Get.theme.colorScheme.secondary,
                                    size: 25,
                                  ));
                          }),
                    ),
                  );
                },
              ),
              const SizedBox(height: 15),
              BtnField(
                title: asset,
                onTap: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25)),
                    ),
                    context: context,
                    builder: (context) => Container(
                      padding: const EdgeInsets.all(15),
                      width: double.infinity,
                      height: Get.mediaQuery.size.height * 0.5,
                      child: FutureBuilder<AssetsModel>(
                          future: productsController.getProductassets(),
                          builder: (context, snapshot) {
                            return (snapshot.hasData)
                                ? ListView.builder(
                                    itemCount: snapshot.data.data.length,
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                      onTap: () {
                                        productsController.asset.value =
                                            snapshot.data.data[index].id;

                                        setState(() {
                                          asset =
                                              snapshot.data.data[index].name;
                                        });
                                        Navigator.of(context).pop();
                                        customSnackBar(
                                            'تم اختيار فئة السياره بنجاح',
                                            CupertinoIcons.checkmark_seal);
                                      },
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(26.0),
                                          child: Text(
                                            '${snapshot.data.data[index].name}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Center(
                                    child: SpinKitThreeBounce(
                                    duration:
                                        const Duration(milliseconds: 1200),
                                    color: Get.theme.colorScheme.secondary,
                                    size: 25,
                                  ));
                          }),
                    ),
                  );
                },
              ),
              const SizedBox(height: 15),
              BtnField(
                title: model,
                onTap: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25)),
                    ),
                    context: context,
                    builder: (context) => Container(
                      padding: const EdgeInsets.all(15),
                      width: double.infinity,
                      height: Get.mediaQuery.size.height * 0.5,
                      child: ListView.builder(
                        itemCount: years.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              model = years[index].toString();
                            });
                            Navigator.of(context).pop();
                            customSnackBar('تم اختيار موديل السياره بنجاح',
                                CupertinoIcons.checkmark_seal);
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(26.0),
                              child: Text(
                                '${years[index]}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 15),
              Container(
                width: Get.mediaQuery.size.width * 0.9,
                child: GlobalTextField.outlineBorder(
                  controller: controller,
                  borderColor: Colors.black,
                  borderRadius: 15,
                  fillColor: Colors.white,
                  hint: 'اسم المنتج',
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ارفق صور للمنتج',
                      style: Get.textTheme.subtitle1.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await loadAssets();
                        await convertImagesToFiles();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Get.theme.primaryColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 150,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    (images.length < 1) == true
                        ? Container()
                        : Directionality(
                            textDirection: TextDirection.rtl,
                            child: Container(
                              height: 120,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: images.length,
                                itemBuilder: (context, index) {
                                  return _oneImgFileAsset(images[index], index);
                                },
                              ),
                            ),
                          ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GlobalBtn(
                title: 'التالى',
                onTap: () {
                  productsController.name.value = controller.text;
                  productsController.mod.value = int.parse(model);
                  productsController.photo.value = fileImageArray[0];
                  productsController.images.value = fileImageArray;

                  Get.toNamed(Routes.ADD_PRODUCT2);
                },
              ),
              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }

  Widget _oneImgFileAsset(Asset img, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: Align(
              alignment: Alignment.centerRight,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AssetThumb(
                    asset: img,
                    width: 300,
                    height: 300,
                    spinner: Center(
                        child: SpinKitThreeBounce(
                      duration: const Duration(milliseconds: 1200),
                      color: Get.theme.colorScheme.secondary,
                      size: 25,
                    )),
                  )),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                setState(() {
                  images.removeAt(index);
                });
              },
              child: Material(
                color: Colors.white,
                elevation: 2,
                shape: CircleBorder(),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: const Icon(Icons.close, size: 18, color: Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
