import 'package:flutter/material.dart';
import 'package:hotel_booking_algoriza/config/routes/magic_router.dart';
import 'package:hotel_booking_algoriza/core/api/end_points.dart';
import 'package:hotel_booking_algoriza/features/explore/data/models/hotels_model.dart';
import 'package:readmore/readmore.dart';
import '../../../../config/locale/app_localizations.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../booking/data/models/booking_hotels_model.dart';
import '../widgets/build_hotel_images_widget.dart';
import '../widgets/build_reviews_list_widget.dart';
import '../widgets/header_widget.dart';
import '../widgets/map_widget.dart';
import '../widgets/rating_container_widget.dart';
import '../widgets/row_material_button_widget.dart';

class HotelDetailsScreen extends StatelessWidget {
  HotelDetailsScreen({Key? key, required this.hotelData}) : super(key: key);
  HotelModel hotelData;
  BookingHotelsModel? createBooking;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: NetworkImage(
                      EndPoints.imageBaseUrl + hotelData.hotelImages[0].image,
                      //"https://www.swissotel.ae/assets/0/92/"
                      //"3686/3768/3770/6442451433/ae87da19-9f23-450a-8927-6f4c700aa104.jpg",
                    ),
                    //AssetImage("asset/hotel2.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RawMaterialButtonWidget(
                      icon: Icons.arrow_back,
                      fillColor: const Color(0xFFcbd0d4),
                      iconColor: Color(0xFF2c2c2c),
                      pressed: () {
                        MagicRouter.pop(context);
                      },
                    ),
                    RawMaterialButtonWidget(
                      icon: Icons.favorite_border_rounded,
                      fillColor: Color(0xFF2c2c2c),
                      iconColor: Color(0xFF4fbe9e),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                hotelData.name,
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
                          AppLocalizations.of(context)!.translate('summary')!,
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
                          trimCollapsedText: AppLocalizations.of(context)!
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
                                  MediaQuery.of(context).size.width * 0.033),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2c2c2c),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 10.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 6),
                                    Text(
                                      hotelData.rate,
                                      // "8.8",
                                      style: const TextStyle(
                                        color: Color(0xFF4fbe9e),
                                        fontWeight: FontWeight.w900,
                                        fontSize: 25,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      AppLocalizations.of(context)!
                                          .translate('room')!,
                                      style: TextStyle(
                                        color: Color(0xFFd5d5d5),
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      AppLocalizations.of(context)!
                                          .translate('services')!,
                                      style: TextStyle(
                                        color: Color(0xFFd5d5d5),
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      AppLocalizations.of(context)!
                                          .translate('location')!,
                                      style: TextStyle(
                                        color: Color(0xFFd5d5d5),
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 12),
                                  Text(
                                    AppLocalizations.of(context)!
                                        .translate('overall_rating')!,
                                    style: const TextStyle(
                                      color: Color(0xFFd5d5d5),
                                      fontWeight: FontWeight.w200,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(height: 19),
                                  RatingContainerWidget(
                                      width: MediaQuery.of(context).size.width *
                                          0.5),
                                  const SizedBox(height: 13),
                                  RatingContainerWidget(
                                    width: MediaQuery.of(context).size.width *
                                        0.50,
                                  ),
                                  const SizedBox(height: 13),
                                  RatingContainerWidget(
                                    width: MediaQuery.of(context).size.width *
                                        0.44,
                                  ),
                                  const SizedBox(height: 13),
                                  RatingContainerWidget(
                                    width: MediaQuery.of(context).size.width *
                                        0.34,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        HeaderWidget(
                          text:
                              AppLocalizations.of(context)!.translate('photo')!,
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
                        const SizedBox(height: 20),
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
    );
  }
}
