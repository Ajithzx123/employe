import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      required this.validator,
      required this.textinputaction,
      required this.textinputtype,
      required this.obscure,
      required this.controller,
      required this.hinttext,
      required this.labeltext})
      : super(key: key);

  final TextInputType? textinputtype;
  final bool? obscure;
  final FormFieldValidator validator;
  final TextEditingController controller;
  final String labeltext;
  final String hinttext;
  final TextInputAction textinputaction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textinputtype,
      obscureText: obscure ?? false,
      controller: controller,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enableSuggestions: true,
      textInputAction: textinputaction,
      decoration: InputDecoration(
          labelText: labeltext,
          labelStyle: TextStyle(color: Colors.black),
          hintText: hinttext,
          hintStyle: TextStyle(fontSize: 12.sp),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(35)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: .3.w),
            borderRadius: BorderRadius.circular(35.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: .3.w),
            borderRadius: BorderRadius.circular(35.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: .3.w),
            borderRadius: BorderRadius.circular(35.0),
          )),
    );
  }
}
