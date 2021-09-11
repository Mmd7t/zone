import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class ImagePickerDialogBtSheet {
  List<Asset> filesAsset = [];

  Widget _roundedButton({String label, Color bgColor, Color txtColor}) {
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      padding: EdgeInsets.all(15.0),
      alignment: Alignment.center,
      decoration: new BoxDecoration(
        color: bgColor,
        borderRadius: new BorderRadius.all(const Radius.circular(100.0)),
      ),
      child: Text(
        label,
        style: new TextStyle(
          color: txtColor,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _openCamera(onGet(f, v), BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    onGet(File(image.path), 1);
    Navigator.pop(context);
  }

  _openGallery(onGet(f, v), BuildContext context) async {
    List<Asset> resultList =
        await MultiImagePicker.pickImages(maxImages: 8, enableCamera: false);

    for (int i = 0; i < resultList.length; i++) {
      filesAsset.add(resultList[i]);
    }
    onGet(filesAsset, 0);
    Navigator.pop(context);
  }

  show({ValueChanged onGet(f, v), BuildContext context}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Material(
          type: MaterialType.transparency,
          child: Opacity(
            opacity: 1.0,
            child: Container(
              padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _openCamera(onGet, context),
                    child: _roundedButton(
                      label: "Camera",
                      bgColor: Get.theme.colorScheme.primary,
                      txtColor: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _openGallery(onGet, context),
                    child: _roundedButton(
                      label: "Gallery",
                      bgColor: Get.theme.colorScheme.primary,
                      txtColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 15.0),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: new Padding(
                      padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                      child: _roundedButton(
                        label: "Cancel",
                        bgColor: Colors.black,
                        txtColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
