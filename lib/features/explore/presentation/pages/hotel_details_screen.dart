import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_algoriza/config/routes/magic_router.dart';
import 'package:hotel_booking_algoriza/core/api/end_points.dart';
import 'package:hotel_booking_algoriza/features/explore/data/models/hotels_model.dart';
import 'package:hotel_booking_algoriza/features/filter/presentation/widgets/map_widget.dart';
import 'package:readmore/readmore.dart';
import 'package:hotel_booking_algoriza/core/utils/color_manager.dart';

import 'package:cached_network_image/cached_network_image.dart';
import '../../../../config/locale/app_localizations.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../../injection_container.dart';
import '../../../booking/data/models/booking_hotels_model.dart';
import '../../../booking/presentation/cubit/booking_cubit.dart';
import '../../../filter/presentation/cubit/search_cubit.dart';
import '../widgets/build_hotel_images_widget.dart';
import '../widgets/build_reviews_list_widget.dart';
import '../widgets/header_widget.dart';
import '../widgets/map_widget.dart';
import '../widgets/rating_container_widget.dart';
import '../widgets/row_material_button_widget.dart';
import 'explore_view.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HotelDetailsScreen extends StatelessWidget {
  HotelDetailsScreen({Key? key, required this.hotelData}) : super(key: key);
  HotelModel hotelData;
  BookingHotelsModel? createBooking;
  ScrollController scrollController = ScrollController();
  double offset = 0;

  @override
  Widget build(BuildContext context) {
    final rate = double.parse(hotelData.rate);
    return Scaffold(
      body: CustomScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              elevation: 0.0,
              pinned: true,
              collapsedHeight: 150,
              expandedHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).viewInsets.top,
              actions: [
                RawMaterialButtonWidget(
                  icon: Icons.arrow_back,
                  fillColor: Color(0xFFcbd0d4),
                  iconColor: Color(0xFF2c2c2c),
                  pressed: () {
                    MagicRouter.pop(context);
                  },
                ),
                Spacer(),
                const RawMaterialButtonWidget(
                  icon: Icons.favorite_border_rounded,
                  fillColor: Color(0xFF2c2c2c),
                  iconColor: Color(0xFF4fbe9e),
                ),
              ],
              flexibleSpace: StatefulBuilder(
                builder: (context, setState) {
                  scrollController.addListener(() {
                    setState.call((() => offset = scrollController.offset));
                  });
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      SizedBox(
                        height: double.infinity,
                        child: CachedNetworkImage(
                          imageUrl: EndPoints.imageBaseUrl +
                              hotelData.hotelImages[0].image,
                          placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator()),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 20,
                        child: AnimatedOpacity(
                          duration: Duration(milliseconds: 0),
                          opacity: (1 - (offset / (MediaQuery.of(context).size.height - 200))).clamp(0, 1),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                                child: Container(
                                  height: 180,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent.withOpacity(0.4),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          hotelData.name,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22),
                                          maxLines: 1,
                                        ),

                                        // RichText(
                                        //   maxLines: 1,
                                        //   text: TextSpan(
                                        //       children: [
                                        //         TextSpan(
                                        //               text: hotelData.address,
                                        //               style: const TextStyle(
                                        //                   color: Colors.white,
                                        //                   fontWeight:
                                        //                   FontWeight.w400,
                                        //                   fontSize: 14)),
                                        //         const WidgetSpan(
                                        //           child: Icon(
                                        //             Icons.location_on,
                                        //             color: Colors.white,
                                        //             size: 15,
                                        //           ),
                                        //         ),
                                        //         TextSpan(
                                        //           text: '\$${hotelData.price}',
                                        //             style: const TextStyle(
                                        //                 color: Colors.white,
                                        //                 fontWeight:
                                        //                 FontWeight.w400,
                                        //                 fontSize: 14)
                                        //         ),
                                        //       ],
                                        //       style: const TextStyle(
                                        //           color: Colors.black)),
                                        // ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    // Expanded(
                                                    //   child: Text(
                                                    //     item!.hotelModel.search[index].address,
                                                    //     maxLines: 2,
                                                    //     style: const TextStyle(
                                                    //       fontSize: 12,
                                                    //       color: Colors.grey,
                                                    //     ),
                                                    //     //maxLines: 2,
                                                    //   ),
                                                    // ),
                                                    Flexible(
                                                        child: RichText(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      strutStyle: StrutStyle(
                                                          fontSize: 13.0),
                                                      text: TextSpan(
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        text: hotelData.address,
                                                      ),
                                                    )),
                                                    const SizedBox(width: 5),
                                                    const Icon(
                                                      Icons.location_on_rounded,
                                                      size: 14,
                                                      color: Color(0xff4fbe9e),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text('\$${hotelData.price}',
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 20)),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            // const RatingBarWidget(),
                                            RatingBar.builder(
                                              minRating: 1,
                                              maxRating: 5,
                                              initialRating: rate,
                                              allowHalfRating: true,
                                              direction: Axis.horizontal,
                                              itemCount: 5,
                                              itemSize: 19,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 0.0,
                                              ),
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                Icons.star,
                                                color: ColorManager.primary,
                                              ),
                                              onRatingUpdate: (double value) {},
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Text(
                                              '80 Reviews ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13),
                                            ),
                                            const Spacer(),
                                            const Text(
                                              '/per night',
                                              style: TextStyle(
                                                //color: AppColors.borderSideColor,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            // Column(
                                            //   children: [
                                            //     Text('\$${hotelData.price}',
                                            //         style: const TextStyle(
                                            //             color: Colors.white,
                                            //             fontWeight:
                                            //                 FontWeight.bold,
                                            //             fontSize: 20)),
                                            //
                                            //   ],
                                            // )
                                          ],
                                        ),
                                        const Spacer(),
                                        MainButton(
                                          onPressed: () {},
                                          backgroundColor: Color(0xFF4fbe9e),
                                          text: AppLocalizations.of(context)!
                                              .translate('book_now')!,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(bottom: 10),
                              //   child: BouncingButton(
                              //       height: 35,
                              //       width: 120,
                              //       color: Colors.transparent.withOpacity(0.4),
                              //       child: Padding(
                              //         padding: const EdgeInsets.all(6.0),
                              //         child: Row(
                              //           children: const [
                              //             Text(
                              //               '  More Details',
                              //               style: TextStyle(
                              //                   color: Colors.white,
                              //                   fontSize: 14,
                              //                   fontWeight: FontWeight.bold),
                              //             ),
                              //             Icon(
                              //               Icons.arrow_downward_rounded,
                              //               size: 15,
                              //               color: Colors.white,
                              //             )
                              //           ],
                              //         ),
                              //       ),
                              //       onPress: () {}),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container(
                      //   width: MediaQuery.of(context).size.width,
                      //   height: 220,
                      //   decoration:  BoxDecoration(
                      //     color: Colors.transparent,
                      //     image: DecorationImage(
                      //       image: NetworkImage(
                      //         EndPoints.imageBaseUrl + hotelData.hotelImages[0].image,
                      //         //"https://www.swissotel.ae/assets/0/92/"
                      //         //"3686/3768/3770/6442451433/ae87da19-9f23-450a-8927-6f4c700aa104.jpg",
                      //       ),
                      //       //AssetImage("asset/hotel2.jpg"),
                      //       fit: BoxFit.fill,
                      //     ),
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       RawMaterialButtonWidget(
                      //         icon: Icons.arrow_back,
                      //         fillColor: Color(0xFFcbd0d4),
                      //         iconColor: Color(0xFF2c2c2c),
                      //         pressed: () {
                      //           MagicRouter.pop(context);
                      //         },
                      //       ),
                      //       RawMaterialButtonWidget(
                      //         icon: Icons.favorite_border_rounded,
                      //         fillColor: Color(0xFF2c2c2c),
                      //         iconColor: Color(0xFF4fbe9e),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        hotelData.name,
                                        //"Grand Royal Hotel",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        //"Wembley, London 2.0km to city ",
                                        maxLines: 2,
                                        hotelData.address,
                                        style: TextStyle(
                                          color: Color(0xFF878787),
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      // "\$180",
                                      "\$${hotelData.price}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      "/${AppLocalizations.of(context)!.translate('per_night')!}",
                                      style: TextStyle(
                                        color: Color(0xFF878787),
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Color(0xFF2c2c2c),
                            indent: 15,
                            endIndent: 15,
                            height: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(27.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!
                                      .translate('summary')!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15,
                                  ),
                                ),
                                ReadMoreText(
                                  // "Featuring a Fitness center, Grand royal park hotel is located in sudia "
                                  //     "5km from gada its a but Featuring a Fitness center, Grand royal park "
                                  //     "hotel is located in sudia",
                                  hotelData.description,
                                  trimLines: 3,
                                  textAlign: TextAlign.justify,
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText:
                                      AppLocalizations.of(context)!
                                          .translate('read_more')!,
                                  trimExpandedText: " show less.. ",
                                  moreStyle: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff64b49f),
                                  ),
                                  lessStyle: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff64b49f),
                                  ),
                                  style: TextStyle(
                                      color: Color(0xFF878787),
                                      fontWeight: FontWeight.w300,
                                      fontFamily: "Poppins-Semibold",
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.033),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF2c2c2c),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 20.0,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              hotelData.rate,
                                              // "8.8",
                                              style: TextStyle(
                                                color: Color(0xFF4fbe9e),
                                                fontWeight: FontWeight.w900,
                                                fontSize: 25,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              AppLocalizations.of(context)!
                                                  .translate('room')!,
                                              style: TextStyle(
                                                color: Color(0xFFd5d5d5),
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              AppLocalizations.of(context)!
                                                  .translate('services')!,
                                              style: TextStyle(
                                                color: Color(0xFFd5d5d5),
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              AppLocalizations.of(context)!
                                                  .translate('location')!,
                                              style: TextStyle(
                                                color: Color(0xFFd5d5d5),
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              AppLocalizations.of(context)!
                                                  .translate('price')!,
                                              style: TextStyle(
                                                color: Color(0xFFd5d5d5),
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Text(
                                            AppLocalizations.of(context)!
                                                .translate('overall_rating')!,
                                            style: TextStyle(
                                              color: Color(0xFFd5d5d5),
                                              fontWeight: FontWeight.w200,
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 19,
                                          ),
                                          RatingContainerWidget(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.54,
                                          ),
                                          SizedBox(
                                            height: 13,
                                          ),
                                          RatingContainerWidget(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.50,
                                          ),
                                          SizedBox(
                                            height: 13,
                                          ),
                                          RatingContainerWidget(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.44,
                                          ),
                                          SizedBox(
                                            height: 13,
                                          ),
                                          RatingContainerWidget(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.34,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                HeaderWidget(
                                  text: AppLocalizations.of(context)!
                                      .translate('photo')!,
                                ),
                                buildHorizontalHotelImagesList(hotelData),
                                HeaderWidget(
                                  text: AppLocalizations.of(context)!
                                      .translate('reviews')!,
                                ),
                                buildHotelReviewList(),
                                Container(
                                  height: 250,
                                  width: double.infinity,
                                  child: const DetailMap(
                                      // lat: double.parse(hotelData.lat),
                                      // lng: double.parse(hotelData.long),
                                      ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                MainButton(
                                  onPressed: () {},
                                  backgroundColor: Color(0xFF4fbe9e),
                                  text: AppLocalizations.of(context)!
                                      .translate('book_now')!,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ]),
    );
  }
}
