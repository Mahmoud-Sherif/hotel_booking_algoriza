import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_algoriza/features/trips/presentation/cubit/trips_cubit.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../core/api/end_points.dart';

class Finished extends StatelessWidget {
  const Finished({Key? key}) : super(key: key);

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
                    .completedHotels!
                    .hotelModel
                    .booking
                    .length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: context.height / 4.5,
                        child: Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: context.width / 2.5,
                                height: double.infinity,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16)),
                                  child: FadeInImage.assetNetwork(
                                    placeholder:
                                        'assets/images/place_holder.png',
                                    image: EndPoints.imageBaseUrl +
                                        BlocProvider.of<TripsCubit>(context)
                                            .completedHotels!
                                            .hotelModel
                                            .booking[index]
                                            .hotel
                                            .hotelImages[0]
                                            .image,
                                    fit: BoxFit.cover,
                                    placeholderFit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              // Container(
                              //   width: context.width / 2.5,
                              //   // height: 160,
                              //   decoration: BoxDecoration(
                              //     borderRadius: const BorderRadius.all(
                              //         Radius.circular(16)),
                              //     image: DecorationImage(
                              //       image: BlocProvider.of<TripsCubit>(context)
                              //               .completedHotels!
                              //               .hotelModel
                              //               .booking[index]
                              //               .hotel
                              //               .hotelImages
                              //               .isNotEmpty
                              //           ? NetworkImage(
                              //               'http://api.mahmoudtaha.com/images/${BlocProvider.of<TripsCubit>(context).completedHotels!.hotelModel.booking[index].hotel.hotelImages[0].image}')
                              //           : const NetworkImage(
                              //               'https://hiueduonline.com/wp-content/plugins/tutor/assets/images/placeholder.jpg'),
                              //       fit: BoxFit.cover,
                              //     ),
                              //   ),
                              // ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            BlocProvider.of<TripsCubit>(context)
                                                .completedHotels!
                                                .hotelModel
                                                .booking[index]
                                                .hotel
                                                .name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium!
                                                .copyWith(
                                                  fontSize: 17,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                            maxLines: 1,
                                          ),
                                          Text(
                                            BlocProvider.of<TripsCubit>(context)
                                                .completedHotels!
                                                .hotelModel
                                                .booking[index]
                                                .hotel
                                                .address,
                                            style: const TextStyle(
                                                color: Color(0xFF666666),
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            '01 Sep - 05 Sep',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            '1 Room 2 People',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on_rounded,
                                            size: 16,
                                            color: Color(0xff4fbe9e),
                                          ),
                                          Text(
                                            '2.0 ${AppLocalizations.of(context)!.translate('km_to_city')!}',
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF666666),
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          RatingBar.builder(
                                            minRating: 1,
                                            maxRating: 5,
                                            initialRating: double.parse(
                                                BlocProvider.of<TripsCubit>(
                                                        context)
                                                    .completedHotels!
                                                    .hotelModel
                                                    .booking[index]
                                                    .hotel
                                                    .rate),
                                            allowHalfRating: true,
                                            direction: Axis.horizontal,
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
                                        ],
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          style: const TextStyle(
                                              color: Colors.black),
                                          children: [
                                            TextSpan(
                                              text:
                                                  '\$ ${BlocProvider.of<TripsCubit>(context).completedHotels!.hotelModel.booking[index].hotel.price}',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 19,
                                                  color: Colors.white),
                                            ),
                                            TextSpan(
                                              text:
                                                  "  /${AppLocalizations.of(context)!.translate('per_night')!}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFF666666),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
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
