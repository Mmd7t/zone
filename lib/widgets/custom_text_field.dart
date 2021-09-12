import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';


const lightStyle = TextStyle(
  fontWeight: FontWeight.normal,
  fontFamily: "Tajawal-Light",
);

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextDirection textDirection;
  final int maxLines;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final bool enabled;
  final Function onTap;
  const CustomTextField(
      {Key key,
        this.hint,
        this.keyboardType,
        this.prefixIcon,
        this.controller,
        this.maxLines,
        this.suffixIcon,
        this.enabled,
        this.onTap,
        this.textDirection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: textDirection == null
          ? keyboardType == TextInputType.number
          ? TextDirection.ltr
          : TextDirection.rtl
          : textDirection,
      child: TextFormField(
        maxLines: maxLines ?? 1,
        keyboardType: keyboardType,
        controller: controller,
        inputFormatters: keyboardType == TextInputType.number
            ? [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ]
            : [],
        validator: (v) {
          if (v.isEmpty) {
            return "هذا الحقل مطلوب";
          }
          return null;
        },
        autofocus: false,
        onTap: onTap,
        enabled: enabled,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon:
          keyboardType == TextInputType.number && textDirection == null
              ? Container(
            width: 90,
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImageIcon(
                  Svg("assets/svg/phoneIcon.svg"),
                  color: Colors.black,
                ),
                Text(
                  "+966 | ",
                  textAlign: TextAlign.end,
                  style: lightStyle.copyWith(
                      fontSize: 16, color: Colors.black),
                )
              ],
            ),
          )
              : prefixIcon,
          hintText: hint,
          hintStyle: lightStyle.copyWith(fontSize: 16, color: Colors.black),
          fillColor: Colors.white,
          filled: true,
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(16.0),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String Function(String) validator;

  const CustomPasswordField(
      {Key key, this.controller, this.validator, this.hint})
      : super(key: key);
  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool vis = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: vis,
      validator: widget.validator ??
              (v) {
            if (v.isEmpty) {
              return "هذا الحقل مطلوب";
            } else if (v.length < 6) {
              return "كلمة المرور ضعيفة";
            }
            return null;
          },
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: ImageIcon(
          Svg("assets/svg/lock.svg"),
          color: Color(0xFF3F454B),
        ),
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              vis = !vis;
            });
          },
          child: vis == true
              ? ImageIcon(
            Svg("assets/svg/eye.svg"),
            color: Color(0xFF3F454B),
          )
              : Icon(
            Icons.visibility_off,
          ),
        ),
        hintText: widget.hint ?? "●●●●●●●●●",
        hintStyle: lightStyle.copyWith(fontSize: 10, color: Colors.grey),
        fillColor: Colors.white,
        filled: true,
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(16.0),
          ),
        ),
      ),
    );
  }
}