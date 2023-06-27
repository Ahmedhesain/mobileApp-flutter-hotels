
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotels_app/core/values/app_colors.dart';
import 'package:hotels_app/core/values/app_constants.dart';

class CustomTextField extends StatelessWidget {

  final Widget? iconWidget;
  final Widget? secondIconWidget;
  final String? label;
  final String? hint;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final List<TextInputFormatter>? format;
  final FormFieldValidator<String>? validate;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final Color? borderColor;
  final Color? inputColor;
  final Color? errorColor;
  final Color? fillColor;
  final double? rightPadding;
  final double? rightContentPadding;
  final double? leftPadding;
  final double? leftContentPadding;
  final double? topPadding;
  final double? borderWidth;
  final bool? filled;
  final bool? enabled;
  final int? maxLines;
  final bool showErrorText;

  const CustomTextField({
    Key? key,
    this.iconWidget,
    this.secondIconWidget,
    this.label,
    this.hint,
    this.inputType,
    this.inputAction,
    this.format,
    this.validate,
    this.onChanged,
    this.borderColor,
    this.fillColor,
    this.leftPadding,
    this.rightPadding,
    this.topPadding,
    this.filled,
    this.inputColor,
    this.maxLines,
    this.borderWidth,
    this.controller,
    this.errorColor,
    this.leftContentPadding,
    this.rightContentPadding,
    this.enabled=true,
    this.showErrorText = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: borderColor??Colors.transparent,width:borderWidth??1),
      borderRadius: BorderRadius.circular(AppConstants.radius),
    );
    return Padding(
      padding: EdgeInsets.only(top: topPadding??0,right: rightPadding??0,left: leftPadding??0 ),
      child: TextFormField(
        keyboardType: inputType,
        inputFormatters: format,
        textInputAction: inputAction,
        cursorColor: Theme.of(context).primaryColor ,
        validator: validate,
        controller: controller,
        onChanged: onChanged,
        enabled: enabled,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(color: inputColor ?? Theme.of(context).textTheme.bodyText1!.color,fontFamily: "Cairo",fontSize: 18),
        maxLines: maxLines??1,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          border: border,
          disabledBorder: border,
          isDense: false,
          enabledBorder: border,
          focusedBorder: border,
          errorText:null,
          fillColor: fillColor??Theme.of(context).backgroundColor,
          contentPadding:  EdgeInsets.fromLTRB(leftContentPadding ??15, 0,rightContentPadding?? 20, 0),
          filled: filled ?? true,
          labelText: label,
          alignLabelWithHint: true,
          labelStyle:TextStyle(color: AppColors.grey,fontFamily: "Cairo"),
          hintText: hint,
          errorBorder:OutlineInputBorder(
            borderSide: BorderSide(color:errorColor ?? borderColor??Colors.transparent,width: 2.5),
            borderRadius: BorderRadius.circular(15),
          ),
          hintStyle: TextStyle(fontSize: 12),
          errorStyle: showErrorText ? TextStyle(color:errorColor ?? Colors.white,fontFamily: "Cairo"):TextStyle(height: 0),
          prefixIcon: iconWidget,
          suffixIcon: secondIconWidget,
        ),
      ),
    );
  }

}
