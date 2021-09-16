import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:top_zone/controllers/products_controller.dart';
import 'package:top_zone/models/assets_model.dart';
import 'package:top_zone/models/brands_model.dart';
import 'package:top_zone/widgets/custom_dialogs.dart';
import 'package:top_zone/widgets/global_back_btn.dart';
import 'package:top_zone/widgets/global_btn.dart';
import 'package:top_zone/widgets/global_textfield.dart';
import 'package:top_zone/widgets/image_picker_sheet%20copy.dart';

class AddProduct3 extends StatefulWidget {
  const AddProduct3({Key key}) : super(key: key);

  @override
  _AddProduct3State createState() => _AddProduct3State();
}

class _AddProduct3State extends State<AddProduct3> {
  final productsController = Get.find<ProductsController>();
  FocusNode focusNode = FocusNode();
  TextEditingController detailsController = TextEditingController();
  final List years = List.generate(23, (index) => index + 2000);
  List<SimilerAs> similerAs = [];
  File _image;

  String picImage = 'صورة توضيحية للوصف';

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
                  focusNode: focusNode,
                  controller: detailsController,
                  borderColor: Colors.black,
                  borderRadius: 15,
                  fillColor: Colors.white,
                  hint: 'وصف المنتج',
                  maxLines: 5,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 1.3),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 15),
                    Text(
                      picImage,
                      style: TextStyle(
                        color: (_image != null)
                            ? Get.theme.colorScheme.secondary
                            : Colors.black,
                        fontWeight: (_image != null)
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    Spacer(),
                    MaterialButton(
                      onPressed: () async {
                        ImagePickerDialog().show(
                            context: context,
                            onGet: (f) {
                              setState(() {
                                _image = f;
                                picImage = 'تم اختيار الصورة بنجاح';
                              });
                            });
                      },
                      child: Text('ارفاق'),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      color: Get.theme.colorScheme.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'يتطابق مع',
                      style: Get.textTheme.subtitle1.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        focusNode.unfocus();
                        SimilerAs similerItem = SimilerAs();
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
                                              setState(() {
                                                similerItem.brandID =
                                                    snapshot.data[index].id;
                                                similerItem.brandeName =
                                                    snapshot.data[index].name;
                                              });

                                              Navigator.of(context).pop();
                                              showModalBottomSheet(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          top: Radius.circular(
                                                              25)),
                                                ),
                                                context: context,
                                                builder: (context) => Container(
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  width: double.infinity,
                                                  height: Get.mediaQuery.size
                                                          .height *
                                                      0.5,
                                                  child: FutureBuilder<
                                                          AssetsModel>(
                                                      future: productsController
                                                          .getProductassets2(
                                                              snapshot
                                                                  .data[index]
                                                                  .id),
                                                      builder:
                                                          (context, snapshott) {
                                                        return (snapshott
                                                                .hasData)
                                                            ? ListView.builder(
                                                                itemCount:
                                                                    snapshott
                                                                        .data
                                                                        .data
                                                                        .length,
                                                                itemBuilder: (context,
                                                                        indexx) =>
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      similerItem.assetId = snapshott
                                                                          .data
                                                                          .data[
                                                                              indexx]
                                                                          .id;
                                                                      similerItem.assetname = snapshott
                                                                          .data
                                                                          .data[
                                                                              indexx]
                                                                          .name;
                                                                    });

                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                    showModalBottomSheet(
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.vertical(top: Radius.circular(25)),
                                                                      ),
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) =>
                                                                              Container(
                                                                        padding:
                                                                            const EdgeInsets.all(15),
                                                                        width: double
                                                                            .infinity,
                                                                        height: Get.mediaQuery.size.height *
                                                                            0.5,
                                                                        child: ListView
                                                                            .builder(
                                                                          itemCount:
                                                                              years.length,
                                                                          itemBuilder: (context, i) =>
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                similerItem.modelId = years[i];
                                                                                similerItem.modelname = years[i].toString();
                                                                              });

                                                                              setState(() {
                                                                                similerAs.add(similerItem);
                                                                              });
                                                                              Navigator.of(context).pop();
                                                                              customSnackBar('تم اختيار موديل السياره بنجاح', CupertinoIcons.checkmark_seal);
                                                                            },
                                                                            child:
                                                                                Card(
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(18),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(26.0),
                                                                                child: Text(
                                                                                  '${years[i]}',
                                                                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                    customSnackBar(
                                                                        'تم اختيار فئة السياره بنجاح',
                                                                        CupertinoIcons
                                                                            .checkmark_seal);
                                                                  },
                                                                  child: Card(
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              18),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                              .all(
                                                                          26.0),
                                                                      child:
                                                                          Text(
                                                                        '${snapshott.data.data[indexx].name}',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontWeight: FontWeight.w600),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            : Center(
                                                                child:
                                                                    SpinKitThreeBounce(
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        1200),
                                                                color: Get
                                                                    .theme
                                                                    .colorScheme
                                                                    .secondary,
                                                                size: 25,
                                                              ));
                                                      }),
                                                ),
                                              );
                                              customSnackBar(
                                                  'تم اختيار نوع السياره بنجاح',
                                                  CupertinoIcons
                                                      .checkmark_seal);
                                            },
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(26),
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
                                          duration: const Duration(
                                              milliseconds: 1200),
                                          color:
                                              Get.theme.colorScheme.secondary,
                                          size: 25,
                                        ));
                                }),
                          ),
                        );
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
              const SizedBox(height: 20),
              if (similerAs.isNotEmpty)
                ListView.builder(
                  itemCount: similerAs.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(index.isEven ? 14 : 0),
                        border: index.isEven ? Border.all(width: 1.3) : null,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${similerAs[index].brandeName}",
                            // style: lightStyle.copyWith(fontSize: 14),
                          ),
                          Text(
                            "${similerAs[index].assetname} (${similerAs[index].modelId})",
                            // style: lightStyle.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              const SizedBox(height: 40),
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
                          productsController.photo.value = _image;
                          List<int> brandid = [];
                          similerAs.forEach((element) {
                            brandid.add(element.brandID);
                          });
                          productsController.brands.value = brandid;

                          List<int> assets = [];
                          similerAs.forEach((element) {
                            assets.add(element.assetId);
                          });
                          productsController.assets.value = assets;

                          List<int> model = [];
                          similerAs.forEach((element) {
                            model.add(element.modelId);
                          });
                          productsController.models.value = model;
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

class SimilerAs {
  String brandeName;
  int brandID;
  String assetname;
  int assetId;
  String modelname;
  int modelId;

  SimilerAs(
      {this.brandeName,
      this.brandID,
      this.assetname,
      this.assetId,
      this.modelname,
      this.modelId});
}




// http://topzoneksa.com