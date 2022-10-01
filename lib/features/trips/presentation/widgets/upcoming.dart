import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_algoriza/features/trips/presentation/cubit/trips_cubit.dart';
import 'package:intl/intl.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../core/utils/color_manager.dart';

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
            : Column(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: BlocProvider.of<TripsCubit>(context)
                        .upcommingHotels!
                        .hotelModel
                        .booking
                        .length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      DateTime day = DateTime.parse(
                          BlocProvider.of<TripsCubit>(context)
                              .upcommingHotels!
                              .hotelModel
                              .booking[index]
                              .createdAt);

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 18),
                        child: Column(
                          children: [
                            Text(
                                ' ${DateFormat("EEEE").format(day)}, ${DateFormat("h:mma").format(DateTime.now())}'),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                width: double.infinity,
                                height: context.height / 3,
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
                                  color: ColorManager.secondry,
                                ),
                                child: Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            topLeft: Radius.circular(20),
                                          ),
                                          image: DecorationImage(
                                            image: BlocProvider.of<TripsCubit>(
                                                        context)
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
                                        height: context.height / 4.5,
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8, top: 8),
                                            child: Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF1a1a1a),
                                                borderRadius:
                                                    BorderRadius.circular(100),
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                                child: RichText(
                                              overflow: TextOverflow.ellipsis,
                                              strutStyle:
                                                  StrutStyle(fontSize: 12.0),
                                              text: TextSpan(
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium!
                                                    .copyWith(
                                                      fontSize: 19,
                                                    ),
                                                text:
                                                    BlocProvider.of<TripsCubit>(
                                                            context)
                                                        .upcommingHotels!
                                                        .hotelModel
                                                        .booking[index]
                                                        .hotel
                                                        .name,
                                              ),
                                            )),
                                            Text(
                                              '\$ ${BlocProvider.of<TripsCubit>(context).upcommingHotels!.hotelModel.booking[index].hotel.price}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium!
                                                  .copyWith(fontSize: 19),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Row(
                                                children: [
                                                  Flexible(
                                                    child: RichText(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      strutStyle: StrutStyle(
                                                          fontSize: 12.0),
                                                      text: TextSpan(
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Colors
                                                                .grey.shade500,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                        text: BlocProvider.of<
                                                                    TripsCubit>(
                                                                context)
                                                            .upcommingHotels!
                                                            .hotelModel
                                                            .booking[index]
                                                            .hotel
                                                            .address,
                                                      ),
                                                    ),
                                                  ),
                                                  // Text(
                                                  //   BlocProvider.of<TripsCubit>(context)
                                                  //       .upcommingHotels!
                                                  //       .hotelModel
                                                  //       .booking[index]
                                                  //       .hotel
                                                  //       .address,
                                                  //   style: const TextStyle(
                                                  //     fontSize: 12,
                                                  //     color: Colors.grey,
                                                  //   ),
                                                  // ),
                                                  const Icon(
                                                    Icons.location_on_rounded,
                                                    size: 16,
                                                    color: Color(0xff4fbe9e),
                                                  ),
                                                  Flexible(
                                                    child: RichText(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      strutStyle: StrutStyle(
                                                          fontSize: 12.0),
                                                      text: TextSpan(
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Colors
                                                                .grey.shade500,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                        text:
                                                            '2.0 ${AppLocalizations.of(context)!.translate('km_to_city')!}',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              "/${AppLocalizations.of(context)!.translate('per_night')!}",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey.shade500,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Row(
                                          children: [
                                            RatingBar.builder(
                                              minRating: 1,
                                              maxRating: 5,
                                              initialRating: double.parse(
                                                  BlocProvider.of<TripsCubit>(
                                                          context)
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
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 2.0,
                                              ),
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Color(0xff4fbe9e),
                                              ),
                                              onRatingUpdate: (double value) {},
                                            ),
                                            Text(
                                              '80 ${AppLocalizations.of(context)!.translate('reviews')!}',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey.shade500,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              );
      },
    );
  }
}
