import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingContainerWidget extends StatelessWidget {
  const RatingContainerWidget({Key? key, required this.width}) : super(key: key);
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.0,
      margin: const EdgeInsets.symmetric(
        vertical: 4.0,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(
            Radius.circular(8.0)),
      ),
      width: width,
    );
  }
}