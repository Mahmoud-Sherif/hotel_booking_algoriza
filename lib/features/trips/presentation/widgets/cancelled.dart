import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_algoriza/features/trips/presentation/cubit/trips_cubit.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/utils/color_manager.dart';

class Cancelled extends StatelessWidget {
  const Cancelled({Key? key}) : super(key: key);

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
                    .cancelledHotels!
                    .hotelModel
                    .booking
                    .length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          width: double.infinity,
                          height: context.height / 5,
                          decoration: BoxDecoration(
                            color: ColorManager.secondry,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: context.width / 3,
                                height: double.infinity,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      bottomLeft: Radius.circular(16)),
                                  child: FadeInImage.assetNetwork(
                                    placeholder:
                                        'assets/images/place_holder.png',
                                    image: EndPoints.imageBaseUrl +
                                        BlocProvider.of<TripsCubit>(context)
                                            .cancelledHotels!
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
                              //   width: context.width / 3,
                              //   height: double.infinity,
                              //   decoration: BoxDecoration(
                              //     borderRadius: const BorderRadius.only(
                              //       topLeft: Radius.circular(16.0),
                              //       bottomLeft: Radius.circular(16.0),
                              //     ),
                              //     image: DecorationImage(
                              //       image: BlocProvider.of<TripsCubit>(context)
                              //               .cancelledHotels!
                              //               .hotelModel
                              //               .booking[index]
                              //               .hotel
                              //               .hotelImages
                              //               .isNotEmpty
                              //           ? NetworkImage(
                              //               'http://api.mahmoudtaha.com/images/${BlocProvider.of<TripsCubit>(context).cancelledHotels!.hotelModel.booking[index].hotel.hotelImages[0].image}')
                              //           : const NetworkImage(
                              //               'https://hiueduonline.com/wp-content/plugins/tutor/assets/images/placeholder.jpg'),
                              //       fit: BoxFit.cover,
                              //     ),
                              //   ),
                              // ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          style: const TextStyle(
                                              color: Colors.black),
                                          children: [
                                            TextSpan(
                                              text:
                                                  '${BlocProvider.of<TripsCubit>(context).cancelledHotels!.hotelModel.booking[index].hotel.name} \n',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium,
                                            ),
                                            TextSpan(
                                              text:
                                                  '${BlocProvider.of<TripsCubit>(context).cancelledHotels!.hotelModel.booking[index].hotel.address} \n',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.location_on_rounded,
                                                size: 16,
                                                color: Color(0xff4fbe9e),
                                              ),
                                              Text(
                                                '2.0 ${AppLocalizations.of(context)!.translate('km_to_city')!}',
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xFF666666),
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '\$ ${BlocProvider.of<TripsCubit>(context).cancelledHotels!.hotelModel.booking[index].hotel.price}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayLarge!
                                                .copyWith(
                                                  fontSize: 22,
                                                ),
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
                                                    .cancelledHotels!
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
                                          Text(
                                            "/${AppLocalizations.of(context)!.translate('per_night')!}",
                                            style: TextStyle(
                                                color: ColorManager.grey,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
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
