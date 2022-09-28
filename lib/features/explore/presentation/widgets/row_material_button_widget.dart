import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RawMaterialButtonWidget extends StatelessWidget {
  const RawMaterialButtonWidget({Key? key, required this.icon, this.pressed, required this.fillColor, required this.iconColor}) : super(key: key);

  final IconData icon;
  final Function()? pressed;
  final Color fillColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: pressed,
      elevation: 2.0,
      fillColor: fillColor,
      child: Icon(
        icon,
        color: iconColor,
        size: 30,
      ),
      padding: EdgeInsets.all(15.0),
      shape: CircleBorder(),
    );
  }
}