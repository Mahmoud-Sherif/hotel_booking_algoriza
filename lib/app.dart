import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_algoriza/config/routes/magic_router.dart';
import 'package:hotel_booking_algoriza/features/auth/data/datasources/local/autl_local_data_source.dart';
import 'package:hotel_booking_algoriza/features/home/presentation/pages/home_view.dart';
import 'package:hotel_booking_algoriza/features/intro/presentation/pages/splash_page.dart';
import 'config/locale/app_localizations_setup.dart';
import 'core/utils/theme_manager.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/lang/presentation/cubit/locale_cubit.dart';
import 'features/profile/presentation/cubit/profile_cubit.dart';
import 'injection_container.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AuthCubit>()),
        BlocProvider(create: (context) => sl<ProfileCubit>()),
        BlocProvider(create: (context) => sl<LocaleCubit>()),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
          buildWhen: (previousState, currentState) {
        return previousState != currentState;
      }, builder: (context, state) {
        return MaterialApp(
          home: sl<AuthLocalDataSource>().isLogged
              ? const HomeView()
              : const SplashPage(),
          // home: TestApi(apiConsumer: sl<ApiConsumer>()),
          // home: const MapTest(),
          debugShowCheckedModeBanner: false,
          theme: getApplicationTheme(),
          onGenerateRoute: onGenerateRoute,
          locale: state.locale,

          navigatorKey: navigatorKey,
          supportedLocales: AppLocalizationsSetup.supportedLocales,
          localeResolutionCallback:
              AppLocalizationsSetup.localeResolutionCallback,
          localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
        );
      }),
    );
  }
}

// class TestApi extends StatefulWidget {
//   TestApi({
//     super.key,
//     required this.apiConsumer,
//   });

//   ApiConsumer apiConsumer;

//   @override
//   State<TestApi> createState() => _TestApiState();
// }

// class _TestApiState extends State<TestApi> {
//   @override
//   void initState() {
//     testApi();
//     super.initState();
//   }

//   testApi() async {
//     LoginParams loginparam;
//     final respone = widget.apiConsumer.post(
//       EndPoints.authLogin,
//       body: {
//         "email": "abdullah.mansour@gmail.com",
//         'password': "123456",
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text("ahahah"),
//       ),
//     );
//   }
// }
