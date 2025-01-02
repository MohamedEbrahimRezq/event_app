import 'package:event_planning_app/app_utls/app_colors.dart';
import 'package:flutter/material.dart';
import '../app_utls/app_styles.dart';
typedef MyValidator =  String? Function(String?);
class CustomTextFormField extends StatelessWidget {
  Color borderColor;
  IconData? preIcon;
  IconData? afterIcon;
  String? hintText;
  int? numLines;
  MyValidator? validator;
  TextEditingController? controller;

  CustomTextFormField({super.key,
    required this.borderColor,
    this.controller,
    this.preIcon,
    this.afterIcon,
    this.hintText,
    this.numLines,
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onTap: (){},
      maxLines: numLines,
      style: AppStyle.primary14bold.copyWith(
        color: borderColor
      ),
      cursorColor: borderColor,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color:borderColor ,width: 1,),
            borderRadius: BorderRadius.circular(16)
        ),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color:AppColors.red ,width: 1,),
            borderRadius: BorderRadius.circular(16)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color:borderColor ,width: 1,),
          borderRadius: BorderRadius.circular(16)
        ),
        prefixIcon: Icon( preIcon ,color: borderColor,),
        suffixIcon: Icon( afterIcon ,color: borderColor,),
        hintStyle:  AppStyle.primary14bold.copyWith(
            color: borderColor
        ),
        hintText:hintText,
      ),
    );
  }
}
