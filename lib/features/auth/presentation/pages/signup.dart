import 'package:flutter/material.dart';
import 'package:hotel_booking_algoriza/core/utils/color_manager.dart';
import 'package:hotel_booking_algoriza/core/widgets/main_button.dart';
import 'package:hotel_booking_algoriza/features/auth/presentation/widgets/login_signup_with.dart';

import '../../../../core/widgets/custom_input_field.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign up',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LoginOrSignupWith(
                  tittle: 'Facebook',
                  icon: Icons.facebook,
                  onPressed: () {},
                  backgroundColor: Colors.blue[800],
                ),
                LoginOrSignupWith(
                  tittle: 'Twitter',
                  icon: Icons.facebook,
                  onPressed: () {},
                  backgroundColor: Colors.blue[500],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'or log in with email',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'First name',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const CustomInputField(hintText: 'enter first name'),
            Text(
              'Last name',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const CustomInputField(hintText: 'enter last name'),
            Text(
              'Your email',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const CustomInputField(hintText: 'enter email'),
            Text(
              'Password',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const CustomInputField(hintText: 'enter password'),
            const SizedBox(height: 10),
            MainButton(text: "Sign up"),
            const SizedBox(height: 5),
            Center(
              child: Text(
                "By signing up, you agreed ",
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            const SizedBox(height: 2),
            Center(
              child: Text(
                "with our TOS and PP",
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have account ?',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Login',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: ColorManager.primary),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
