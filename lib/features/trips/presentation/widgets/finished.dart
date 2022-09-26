import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotel_booking_algoriza/features/trips/presentation/cubit/trips_cubit.dart';

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
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 130,
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                image: DecorationImage(
                                  image: BlocProvider.of<TripsCubit>(context)
                                          .completedHotels!
                                          .hotelModel
                                          .booking[index]
                                          .hotel
                                          .hotelImages
                                          .isNotEmpty
                                      ? NetworkImage(
                                          'http://api.mahmoudtaha.com/images/${BlocProvider.of<TripsCubit>(context).completedHotels!.hotelModel.booking[index].hotel.hotelImages[0].image}')
                                      : const NetworkImage(
                                          'https://hiueduonline.com/wp-content/plugins/tutor/assets/images/placeholder.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style:
                                          const TextStyle(color: Colors.black),
                                      children: [
                                        TextSpan(
                                          text:
                                              '${BlocProvider.of<TripsCubit>(context).completedHotels!.hotelModel.booking[index].hotel.name} \n',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              '${BlocProvider.of<TripsCubit>(context).completedHotels!.hotelModel.booking[index].hotel.address} \n',
                                          style: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '01 Sep - 05 Sep \n',
                                          style: TextStyle(
                                            color: Colors.grey.shade900,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '1 Room 2 People',
                                          style: TextStyle(
                                            color: Colors.grey.shade900,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.location_on_rounded,
                                        size: 16,
                                        color: Color(0xff4fbe9e),
                                      ),
                                      Text(
                                        '2.0 km to city',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
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
                                            BlocProvider.of<TripsCubit>(context)
                                                .completedHotels!
                                                .hotelModel
                                                .booking[index]
                                                .hotel
                                                .rate),
                                        allowHalfRating: true,
                                        direction: Axis.horizontal,
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
                                    ],
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style:
                                          const TextStyle(color: Colors.black),
                                      children: [
                                        TextSpan(
                                          text:
                                              '\$ ${BlocProvider.of<TripsCubit>(context).completedHotels!.hotelModel.booking[index].hotel.price}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                        const TextSpan(
                                          text: '/per night',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
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
