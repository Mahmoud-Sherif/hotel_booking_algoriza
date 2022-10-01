import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hotel_booking_algoriza/core/utils/color_manager.dart';

class CustmProgreesIndicator extends StatelessWidget {
  const CustmProgreesIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitSquareCircle(
        color: ColorManager.primary,
      ),
    );
  }
}
