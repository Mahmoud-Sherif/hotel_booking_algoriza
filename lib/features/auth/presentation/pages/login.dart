import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_algoriza/config/routes/magic_router.dart';
import 'package:hotel_booking_algoriza/core/api/api_consumer.dart';
import 'package:hotel_booking_algoriza/core/api/dio_consumer.dart';
import 'package:hotel_booking_algoriza/core/widgets/main_button.dart';
import 'package:hotel_booking_algoriza/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:hotel_booking_algoriza/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:hotel_booking_algoriza/features/auth/domain/usecases/login_usecase.dart';
import 'package:hotel_booking_algoriza/features/auth/domain/usecases/register_usecase.dart';
import 'package:hotel_booking_algoriza/features/auth/presentation/widgets/login_signup_with.dart';
import 'package:hotel_booking_algoriza/features/home/presentation/pages/home_view.dart';
import 'package:hotel_booking_algoriza/injection_container.dart';
import '../../../../core/widgets/custom_input_field.dart';
import '../../../../core/widgets/progrees_indicator.dart';
import '../cubit/auth_cubit.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();
  // final _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      // AuthCubit(
      // loginUseCase: LoginUseCase(
      //     authRepo: AuthRepositoryImpl(
      //         authRemoteDatasource: AuthRemoteDatasourceImpl(
      //   apiConsumer: DioConsumer(client: Dio()),
      // ))),
      // registerUseCase: RegisterUseCase(
      //     authRepo: AuthRepositoryImpl(
      //         authRemoteDatasource: AuthRemoteDatasourceImpl(
      //   apiConsumer: DioConsumer(client: Dio()),
      // ))))
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return state is LoginLodaing
              ? const CustmProgreesIndicator()
              : Scaffold(
                  appBar: AppBar(),
                  body: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Login',
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
                              'Your email',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            CustomInputField(
                              hintText: 'enter email',
                              inputController: _conEmail,
                              // formKey: _keyForm,
                            ),
                            Text(
                              'Password',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            CustomInputField(
                              hintText: 'enter password',
                              inputController: _conPassword,
                              obscureText: true,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: () {},
                                  child: const Text('Forgot your Password ?')),
                            ),
                            BlocBuilder<AuthCubit, AuthState>(
                              builder: (context, state) {
                                return MainButton(
                                  text: 'Login',
                                  onPressed: () async {
                                    await BlocProvider.of<AuthCubit>(context)
                                        .login(
                                      LoginParams(
                                        email: _conEmail.text,
                                        password: _conPassword.text,
                                      ),
                                    );
                                    MagicRouter.navigateAndPopAll(HomeView());
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
