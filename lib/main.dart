import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_algoriza/core/dio_helper.dart';
import 'package:hotel_booking_algoriza/features/home/data/models/hotels_model.dart';

import 'features/booking/data/models/booking_hotels_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TestApi(),
    );
  }
}

class TestApi extends StatefulWidget {
  const TestApi({super.key});

  @override
  State<TestApi> createState() => _TestApiState();
}

class _TestApiState extends State<TestApi> {
  @override
  void initState() {
    testApi();
    super.initState();
  }

  testApi() async {
    final response = await DioHelper.testApi();
    BookingHotelsModel data = BookingHotelsModel.fromJson(response.data);
    print(data.hotelModel.booking[0].hotel.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
