import 'package:flutter/material.dart';
import 'package:hotel_booking_algoriza/core/utils/color_manager.dart';
import 'package:hotel_booking_algoriza/core/utils/values_manager.dart';
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
        padding: const EdgeInsets.all(20),
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
            const CustomInputField(hintText: 'enter email'),
            Text(
              'Password',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const CustomInputField(hintText: 'enter password'),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot your Password ?')),
            ),
          ],
        ),
      ),
    );
  }
}
