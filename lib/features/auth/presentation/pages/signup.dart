import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_algoriza/config/routes/magic_router.dart';
import 'package:hotel_booking_algoriza/core/utils/color_manager.dart';
import 'package:hotel_booking_algoriza/core/widgets/main_button.dart';
import 'package:hotel_booking_algoriza/core/widgets/progrees_indicator.dart';
import 'package:hotel_booking_algoriza/features/auth/domain/usecases/register_usecase.dart';
import 'package:hotel_booking_algoriza/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:hotel_booking_algoriza/features/auth/presentation/pages/login.dart';
import 'package:hotel_booking_algoriza/features/auth/presentation/widgets/login_signup_with.dart';
import 'package:hotel_booking_algoriza/features/home/presentation/pages/home_view.dart';

import '../../../../core/widgets/custom_input_field.dart';
import '../../../../injection_container.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();
  final _conFirstName = TextEditingController();
  final _conLastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return state is RegisterLodaing
              ? const CustmProgreesIndicator()
              : Scaffold(
                  appBar: AppBar(),
                  body: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: SingleChildScrollView(
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
                          CustomInputField(
                              hintText: 'enter first name',
                              inputController: _conFirstName),
                          Text(
                            'Last name',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          CustomInputField(
                              hintText: 'enter last name',
                              inputController: _conLastName),
                          Text(
                            'Your email',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          CustomInputField(
                              hintText: 'enter email',
                              inputController: _conEmail),
                          Text(
                            'Password',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          CustomInputField(
                              hintText: 'enter password',
                              inputController: _conPassword),
                          const SizedBox(height: 10),
                          BlocBuilder<AuthCubit, AuthState>(
                            builder: (context, state) {
                              return MainButton(
                                text: "Sign up",
                                onPressed: () async {
                                  await BlocProvider.of<AuthCubit>(context)
                                      .register(
                                    RegisterParams(
                                      name: _conFirstName.text +
                                          _conLastName.text,
                                      email: _conEmail.text,
                                      password: _conPassword.text,
                                      passwordConfirm: _conPassword.text,
                                    ),
                                  );
                                  MagicRouter.navigateAndPopAll(HomeView());
                                },
                              );
                            },
                          ),
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
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                                TextButton(
                                  onPressed: () {
                                    MagicRouter.navigateTo(LoginView());
                                  },
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
                  ),
                );
        },
      ),
    );
  }
}
