import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_algoriza/core/api/api_consumer.dart';
import 'package:hotel_booking_algoriza/core/widgets/progrees_indicator.dart';
import 'package:hotel_booking_algoriza/features/trips/presentation/cubit/trips_cubit.dart';
import 'package:hotel_booking_algoriza/features/trips/presentation/widgets/cancelled.dart';
import 'package:hotel_booking_algoriza/features/trips/presentation/widgets/finished.dart';
import 'package:hotel_booking_algoriza/features/trips/presentation/widgets/upcoming.dart';
import 'package:hotel_booking_algoriza/injection_container.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../core/utils/color_manager.dart';

class TripsPage extends StatelessWidget {
  const TripsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripsCubit(apiConsumer: sl<ApiConsumer>())
        ..getAllHotelsByTypeUpcomming()
        ..getAllHotelsByTypeCompleted()
        ..getAllHotelsByTypeCancelled(),
      child: BlocBuilder<TripsCubit, TripsState>(
        builder: (context, state) {
          return state is TripsLoadingState
              ? const CustmProgreesIndicator()
              : Scaffold(
                  backgroundColor: const Color(0xFF1a1a1a),
                  appBar: AppBar(
                    title: Text(
                      AppLocalizations.of(context)!.translate('my_trip')!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  body: SingleChildScrollView(
                    child: DefaultTabController(
                      length: 3,
                      initialIndex: 0,
                      child: Center(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                  color: ColorManager.secondry,
                                ),
                                child: TabBar(
                                  labelColor: Color(0xff4fbe9e),
                                  unselectedLabelColor: Colors.grey,
                                  indicatorWeight: 0.01,
                                  indicatorColor: Colors.transparent,
                                  tabs: [
                                    Tab(
                                        text: AppLocalizations.of(context)!
                                            .translate('upcoming')!),
                                    Tab(
                                        text: AppLocalizations.of(context)!
                                            .translate('finished')!),
                                    Tab(
                                        text: AppLocalizations.of(context)!
                                            .translate('cancelled')!),
                                  ],
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: SizedBox(
                                height: 665,
                                child: TabBarView(
                                  children: [
                                    Upcoming(),
                                    Finished(),
                                    Cancelled(),
                                    SizedBox(height: 100)
                                  ],
                                ),
                              ),
                            ),
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
