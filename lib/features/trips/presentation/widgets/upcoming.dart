import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotel_booking_algoriza/features/trips/presentation/cubit/trips_cubit.dart';

import '../../../../config/locale/app_localizations.dart';

class Upcoming extends StatelessWidget {
  const Upcoming({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripsCubit, TripsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state is TripsLoadingState
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: BlocProvider.of<TripsCubit>(context)
                    .upcommingHotels!
                    .hotelModel
                    .booking
                    .length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: [
                      const Text('01 Sep - 05 Sep, 1 Room 2 People'),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: 350,
                        height: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 4),
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                  image: BlocProvider.of<TripsCubit>(context)
                                          .upcommingHotels!
                                          .hotelModel
                                          .booking[index]
                                          .hotel
                                          .hotelImages
                                          .isNotEmpty
                                      ? NetworkImage(
                                          'http://api.mahmoudtaha.com/images/${BlocProvider.of<TripsCubit>(context).upcommingHotels!.hotelModel.booking[index].hotel.hotelImages[0].image}')
                                      : const NetworkImage(
                                          'https://hiueduonline.com/wp-content/plugins/tutor/assets/images/placeholder.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              width: double.infinity,
                              height: 200,
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(right: 8, top: 8),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.favorite_outline,
                                        color: Color(0xff4fbe9e),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    BlocProvider.of<TripsCubit>(context)
                                        .upcommingHotels!
                                        .hotelModel
                                        .booking[index]
                                        .hotel
                                        .name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    '\$ ${BlocProvider.of<TripsCubit>(context).upcommingHotels!.hotelModel.booking[index].hotel.price}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        BlocProvider.of<TripsCubit>(context)
                                            .upcommingHotels!
                                            .hotelModel
                                            .booking[index]
                                            .hotel
                                            .address,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.location_on_rounded,
                                        size: 16,
                                        color: Color(0xff4fbe9e),
                                      ),
                                       Text(
                                        '2.0 ${AppLocalizations.of(context)!.translate('km_to_city')!}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                   Text(
                                    "/${AppLocalizations.of(context)!.translate('per_night')!}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                children: [
                                  RatingBar.builder(
                                    minRating: 1,
                                    maxRating: 5,
                                    initialRating: double.parse(
                                        BlocProvider.of<TripsCubit>(context)
                                            .upcommingHotels!
                                            .hotelModel
                                            .booking[index]
                                            .hotel
                                            .rate),
                                    allowHalfRating: true,
                                    direction: Axis.horizontal,
                                    tapOnlyMode: true,
                                    itemCount: 5,
                                    itemSize: 16,
                                    itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 2.0,
                                    ),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Color(0xff4fbe9e),
                                    ),
                                    onRatingUpdate: (double value) {},
                                  ),
                                   Text(
                                    '80 ${AppLocalizations.of(context)!.translate('reviews')!}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
