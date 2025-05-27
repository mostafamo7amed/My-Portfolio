import 'package:flutter/material.dart';
import 'package:my_personal_portfolio/core/themes/app_colors.dart';

import '../themes/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.suffixIcon,
      this.controller,
      this.hintText,
      this.validator,
      this.keyboardType,
      this.onSaved,
      this.obscureText = false, this.initialValued, this.readOnly=false, this.prefixIcon, this.maxLines=1, this.onTap});
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? initialValued;
  final bool readOnly;
  final int? maxLines;

  final void Function(String?)? onSaved;
  final void Function()? onTap;

  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        onTap: onTap,
        maxLines:maxLines ,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        style: AppTextStyles.font16NormalDarkGray600(context).copyWith(color: AppColors.darkGray50),
        readOnly:readOnly,
        initialValue: initialValued,
        controller: controller,
        obscureText: obscureText,
        onSaved: onSaved,
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: AppTextStyles.font16NormalDarkGray600(context).copyWith(color: AppColors.darkGray200),
          fillColor: AppColors.lightGray300,
          filled: true,
          border: buildOutlineInputBorder(),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineFocusedInputBorder(),
          errorBorder: buildOutlineErrorInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        width: 1,
        color: AppColors.darkGray200,
      ),
    );
  }

  OutlineInputBorder buildOutlineFocusedInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        width: 1,
        color: AppColors.logoColor,
      ),
    );
  }

  OutlineInputBorder buildOutlineErrorInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        width: 1,
        color: AppColors.darkGray,
      ),
    );
  }
}
