import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_zone/controllers/products_controller.dart';
import 'package:top_zone/routes/app_pages.dart';
import 'package:top_zone/widgets/global_back_btn.dart';
import 'package:top_zone/widgets/global_btn.dart';
import 'package:top_zone/widgets/global_textfield.dart';

class AddProduct2 extends StatefulWidget {
  const AddProduct2({Key key}) : super(key: key);

  @override
  _AddProduct2State createState() => _AddProduct2State();
}

class _AddProduct2State extends State<AddProduct2> {
  final productsController = Get.find<ProductsController>();
  final List _cast = ['جديد', 'مستعمل'];
  TextEditingController priceController = TextEditingController();
  TextEditingController poductNumberController = TextEditingController();
  TextEditingController poductWarrantyController = TextEditingController();
  @override
  void initState() {
    super.initState();
    print(productsController.asset.value);
    print(productsController.category.value);
    print(productsController.brand.value);
    print(productsController.name.value);
    print(productsController.images[0]);
    print(productsController.photo.value);
  }

  int groupval = 0;
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
                  controller: priceController,
                  borderColor: Colors.black,
                  borderRadius: 15,
                  fillColor: Colors.white,
                  textInputType: TextInputType.number,
                  hint: 'السعر',
                  suffix: 'ر.س',
                ),
              ),
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black, width: 1.3),
                ),
                width: Get.mediaQuery.size.width * 0.9,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        'الكمية',
                        style: Get.textTheme.bodyText1
                            .copyWith(color: Colors.black45),
                      ),
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Get.theme.colorScheme.primary,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18),
                            child: InkWell(
                              onTap: () {
                                productsController.amount.value++;
                              },
                              child: Icon(Icons.add),
                            ),
                          ),
                          Obx(() => Text(
                                '${productsController.amount.value}',
                                style: Get.textTheme.headline6
                                    .copyWith(color: Colors.white),
                              )),
                          Padding(
                            padding: const EdgeInsets.all(18),
                            child: InkWell(
                              onTap: () {
                                productsController.amount.value--;
                              },
                              child: Icon(Icons.remove),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: Get.mediaQuery.size.width * 0.9,
                child: GlobalTextField.outlineBorder(
                  controller: poductNumberController,
                  borderColor: Colors.black,
                  borderRadius: 15,
                  fillColor: Colors.white,
                  textInputType: TextInputType.number,
                  hint: 'رقم القطعة',
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: Get.mediaQuery.size.width * 0.9,
                child: GlobalTextField.outlineBorder(
                  controller: poductWarrantyController,
                  borderColor: Colors.black,
                  borderRadius: 15,
                  fillColor: Colors.white,
                  textInputType: TextInputType.number,
                  hint: 'فترة الضمان',
                  suffix: 'شهر',
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
                      'حالة المنتج',
                      style: Get.textTheme.subtitle1.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Wrap(
                spacing: 5,
                children: List.generate(
                  _cast.length,
                  (index) => ChoiceChip(
                    label: Text(_cast[index]),
                    selected: groupval == index,
                    labelPadding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                    selectedColor: Get.theme.colorScheme.secondary,
                    pressElevation: 3,
                    avatar: (groupval == index)
                        ? Icon(CupertinoIcons.checkmark_seal)
                        : null,
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                    padding: const EdgeInsets.all(5.0),
                    onSelected: (value) {
                      setState(() {
                        groupval = value ? index : null;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 35),
              GlobalBtn(
                title: 'التالى',
                onTap: () {
                  productsController.price.value =
                      double.parse(priceController.text);
                  productsController.productNumber.value =
                      int.parse(poductNumberController.text);
                  productsController.productWarranty.value =
                      int.parse(poductWarrantyController.text);
                  productsController.productCondition.value = groupval;
                  productsController.carType.value = groupval;
                  Get.toNamed(Routes.ADD_PRODUCT3);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
