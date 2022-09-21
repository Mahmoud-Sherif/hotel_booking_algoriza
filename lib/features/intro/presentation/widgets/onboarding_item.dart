import 'package:flutter/material.dart';
import 'package:hotel_booking_algoriza/features/intro/data/models/onboarding_model.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({Key? key, required this.model}) : super(key: key);

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: 250,
          child: Image(
            image: NetworkImage(model.image),
          ),
        ),
        const SizedBox(
          height: 70.0,
        ),
        Text(
          model.title,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          model.body,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
