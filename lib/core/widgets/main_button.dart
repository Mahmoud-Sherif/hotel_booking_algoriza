import 'package:flutter/material.dart';
import 'package:hotel_booking_algoriza/core/utils/color_manager.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.text,
    this.backgroundColor = ColorManager.primary,
    this.foregroundColor = ColorManager.white,
    this.horizontalPadding = 0,
    this.width = double.infinity,
    this.onPressed,
  }) : super(key: key);
  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double horizontalPadding;
  final double? width;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: SizedBox(
        width: width,
        height: 50,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: foregroundColor,
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            elevation: 0,
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
