import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_algoriza/core/api/api_consumer.dart';
import 'package:hotel_booking_algoriza/core/api/dio_consumer.dart';
import 'package:hotel_booking_algoriza/core/api/end_points.dart';
import 'package:hotel_booking_algoriza/features/home/presentation/pages/home_view.dart';
import 'bloc_observer.dart';
import 'core/utils/theme_manager.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeView(),
      // home: TestApi(apiConsumer: sl<ApiConsumer>()),
      theme: getApplicationTheme(),
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
//     final response = await widget.apiConsumer.get(EndPoints.profileInfo);
//     // print(response);
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
