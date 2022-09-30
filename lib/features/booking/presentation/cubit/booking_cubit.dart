import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../data/models/booking_hotels_model.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());
}
