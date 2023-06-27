
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hotels_app/core/utils/common.dart';
import 'package:hotels_app/core/values/app_constants.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key,
    this.text,
    this.onPressed,
    this.svgPath,
    this.buttonColor,
    this.fontColor,
    this.fontSize,
    this.isOutlined = false,
    this.icon,
    this.expanded = false,
    this.contentPadding,
    this.margin = EdgeInsets.zero,
    this.width,
    this.height,
    this.radius = AppConstants.radius,
    this.textDirection,
    this.isLoading = false,
  }) : assert(!(svgPath != null && icon != null)), super(key: key);

  final Function()? onPressed;
  final String? text;
  final String? svgPath;
  final Color? buttonColor;
  final Color? fontColor;
  final bool expanded;
  final bool isLoading;
  final bool isOutlined;
  final double? width;
  final double? height;
  final double? fontSize;
  final double radius;
  final IconData? icon;
  final EdgeInsets? contentPadding;
  final EdgeInsets margin;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {

    final child = Row(
      textDirection: textDirection,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
      children: [

        if(icon != null)
          Icon(icon),
        if((svgPath != null || icon != null) && text != null)
          const SizedBox(width: 10,),
        if(text != null)
          Text(text!.tr,style: TextStyle(fontSize: fontSize,height: 1),),
      ],
    );
    return SizedBox(
      height: height,
      width: width,
      child: Padding(
        padding: margin,
        child: Builder(
            builder: (context) {
              if(isOutlined) {
                return OutlinedButton(
                    onPressed: onPressed,
                    style: OutlinedButton.styleFrom(
                        primary: buttonColor,
                        // onPrimary: fontColor,
                        side: BorderSide(color: buttonColor ?? Theme.of(context).primaryColor,width: 2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(radius)
                        ),
                        padding: contentPadding ?? EdgeInsets.all(15)
                    ),
                    child: child
                );
              }
              return ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                      primary: buttonColor,
                      onPrimary: fontColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(radius)
                      ),
                      padding: contentPadding
                  ),
                  child: child
              );
            }
        ),
      ),
    );
  }
}
