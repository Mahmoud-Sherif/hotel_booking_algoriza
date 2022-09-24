import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget dividerWidget(double indent, double endIndent, double height) {
  return Divider(
    color: Color(0xFF272727),
    indent: indent,
    endIndent: endIndent,
    height: height,
    thickness: 1,
  );
}