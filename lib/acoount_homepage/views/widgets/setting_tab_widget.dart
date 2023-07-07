
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotels_app/components/text_widget.dart';

class SettingTabWidget extends GetView<SettingTabWidget> {
  const SettingTabWidget(this.icon, this.name,  {Key? key}) : super(key: key);
  final IconData icon;
  final String name;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Icon(icon)
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5,0,5,0),
              child: TextWidget(name  , size: 16, weight: FontWeight.w600,),
            ),


          ],
        ),
      ),
    );

  }
}
