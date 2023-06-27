
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hotels_app/components/text_widget.dart';
import 'package:hotels_app/core/values/app_constants.dart';
import 'package:hotels_app/core/values/languages/app_translation.dart';

import '../core/values/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({Key? key,
    this.upLabel,
    this.initialValue,
    this.label,
    this.prefix,
    this.prefixWidget,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    this.onChange,
    this.onSuffixClicked,
    this.nextFocusNode,
    this.focusNode,
    this.validator,
    this.suffix,
    this.obscure = false,
    this.heightBetween = 10,
    this.textInputAction,
    this.justNumbers = false,
    this.enabled = true,
    this.textInputType,
    this.hint,
    this.controller,
    this.ltr,
    this.maxLines,
    this.onTap,
    this.contentPadding,
    this.multiLines = false,
    this.onSubmitted,
    this.hideErrorText = false,
    this.suffixIconSize ,
    this.textAlign ,
    this.suffixIconColor,

  }) : super(key: key);

  final String? upLabel;
  final String? initialValue;
  final TextAlign? textAlign;
  final double heightBetween;
  final double? suffixIconSize;
  final EdgeInsets? contentPadding;
  final String? label;
  final String? hint;
  final int? maxLength;
  final Color? suffixIconColor;
  final int? maxLines;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? prefixWidget;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final Function(String)? onChange;
  final Function(String)? onSubmitted;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final Function()? onSuffixClicked;
  final bool obscure;
  final bool enabled;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final bool justNumbers;
  final bool? ltr;
  final bool multiLines;
  final bool hideErrorText;

  @override
  Widget build(BuildContext context) {
    // final ltr = this.ltr ?? !AppTranslation.isArabic;
    final sufIcon = suffix ?? (suffixIcon != null
        ? SizedBox(
      height: 40,
      width: 40,
      // child: IconButtonWidget(
      //   icon: suffixIcon,
      //   color: suffixIconColor,
      //   iconSize: suffixIconSize,
      //   onPressed: onSuffixClicked,
      // ),
    ):null);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(upLabel != null)
          Padding(
            padding: EdgeInsets.only(bottom: heightBetween,left: 5,right: 5),
            child: TextWidget(upLabel!,size: 15,textColor: AppColors.textFieldLabelColor,),
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(prefixWidget != null)
              prefixWidget!,
            Expanded(
              child: TextFormField(
                validator: validator,
                controller: controller,
                maxLength: maxLength,
                expands: multiLines,
                initialValue: initialValue,
                onChanged: onChange,
                onFieldSubmitted: onSubmitted,
                onTap: onTap,
                focusNode: focusNode,
                readOnly: !enabled,
                maxLines: multiLines? null : (maxLines??1),
                onEditingComplete: nextFocusNode == null ? null : () => nextFocusNode!.requestFocus(),
                textInputAction: textInputAction,
                style: const TextStyle(height: 1.5,leadingDistribution: TextLeadingDistribution.proportional,fontSize: 20),
                keyboardType: textInputType,
                obscureText: obscure,
                inputFormatters: [
                  if(justNumbers)
                    FilteringTextInputFormatter.digitsOnly
                ],
                textAlignVertical: TextAlignVertical.top,
                textAlign: textAlign ?? TextAlign.start,
                decoration: InputDecoration(
                  labelText: label?.tr,
                  hintText: hint?.tr,
                  counterText: "",
                  fillColor: Colors.white,
                  filled: true,
                  errorStyle: hideErrorText ? const TextStyle(height: 0,color: Colors.transparent) : null,
                  constraints: const BoxConstraints(minHeight: 30,maxHeight: 100),
                  contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  hintStyle: TextStyle(color: AppColors.textFieldHintColor, height: 1.5, leadingDistribution: TextLeadingDistribution.even,),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppConstants.radius),
                      borderSide: const BorderSide(color: AppColors.appGreyDark,width: 2)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppConstants.radius),
                      borderSide: const BorderSide(color: AppColors.appGreyDark, width: 2)
                  ),
                  isDense: true,
                  prefix: prefix,
                  prefixIconConstraints: const BoxConstraints(maxHeight: 40,minWidth: 40,minHeight: 20),
                  prefixIcon: prefixIcon,
                  suffixIconConstraints: const BoxConstraints(maxHeight: 40,minHeight: 20),
                  suffixIcon: sufIcon,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
