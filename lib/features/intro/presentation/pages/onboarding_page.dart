import 'package:flutter/material.dart';
import 'package:hotel_booking_algoriza/config/routes/magic_router.dart';
import 'package:hotel_booking_algoriza/features/auth/presentation/pages/login.dart';
import 'package:hotel_booking_algoriza/features/auth/presentation/pages/signup.dart';
import 'package:hotel_booking_algoriza/features/intro/data/models/onboarding_model.dart';
import 'package:hotel_booking_algoriza/features/intro/presentation/widgets/onboarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({Key? key}) : super(key: key);

  final PageController boardController = PageController();
  final List<OnBoardingModel> onBoarding = [
    OnBoardingModel(
      image:
          'https://www.pngall.com/wp-content/uploads/8/World-Travel-PNG-Clipart.png',
      title: 'Plan your trips',
      body: 'Book one of your unique hotel escape the ordinary',
    ),
    OnBoardingModel(
      image:
          'https://www.capitoliumad.it/wp-content/uploads/2022/02/travel.png',
      title: 'Find best deals.',
      body: 'Find deals for any season from cosy country homes to city flats',
    ),
    OnBoardingModel(
      image:
          'https://papik.pro/uploads/posts/2021-11/1636015589_4-papik-pro-p-vektornie-risunki-puteshestvie-4.png',
      title: 'Best travelling all time',
      body: 'Find deals for any season from cosy country homes to city flats',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Expanded(
              child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: boardController,
                    itemBuilder: (BuildContext context, int index) =>
                        OnBoardingItem(
                      model: onBoarding[index],
                    ),
                    itemCount: onBoarding.length,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SmoothPageIndicator(
              controller: boardController,
              effect: const SwapEffect(
                dotColor: Colors.grey,
                activeDotColor: Color(0xff4fbe9e),
                dotHeight: 10.0,
                dotWidth: 10.0,
                spacing: 5.0,
              ),
              count: onBoarding.length,
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    MagicRouter.navigateTo(LoginView());
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xff4fbe9e),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    MagicRouter.navigateTo(SignupView());
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    elevation: 0.5,
                  ),
                  child: const Text(
                    'Create account',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
