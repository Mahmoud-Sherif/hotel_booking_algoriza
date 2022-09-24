import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/widgets/main_button.dart';
import '../../../profile/presentation/widgets/divider_widget.dart';
import '../widgets/build_hotel_images_widget.dart';
import '../widgets/build_reviews_list_widget.dart';
import '../widgets/header_widget.dart';
import '../widgets/rating_container_widget.dart';
import '../widgets/row_material_button_widget.dart';

class HotelDetailsScreen extends StatelessWidget {
  const HotelDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 220,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://www.swissotel.ae/assets/0/92/3686/3768/3770/6442451433/ae87da19-9f23-450a-8927-6f4c700aa104.jpg"),
                    //AssetImage("asset/hotel2.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    RawMaterialButtonWidget(icon: Icons.arrow_back, fillColor: Color(0xFFcbd0d4), iconColor: Color(0xFF2c2c2c),),
                    RawMaterialButtonWidget(icon: Icons.favorite_border_rounded, fillColor: Color(0xFF2c2c2c), iconColor: Color(0xFF4fbe9e),),

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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Grand Royal Hotel",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Wembley, London 2.0km to city ",
                              style: TextStyle(
                                color: Color(0xFF878787),
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "180",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "/per night",
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
                          "Summary",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 15,
                          ),
                        ),
                        ReadMoreText(
                          "Featuring a Fitness center, Grand royal park hotel is located in sudia "
                              "5km from gada its a but Featuring a Fitness center, Grand royal park "
                              "hotel is located in sudia",
                          trimLines: 3,
                          textAlign: TextAlign.justify,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: " read more.. ",
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
                              fontSize: MediaQuery.of(context).size.width * 0.033),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 20.0,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "8.8",
                                      style: TextStyle(
                                        color: Color(0xFF4fbe9e),
                                        fontWeight: FontWeight.w900,
                                        fontSize: 35,
                                      ),
                                    ),
                                    Text(
                                      "Room",
                                      style: TextStyle(
                                        color: Color(0xFFd5d5d5),
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Text(
                                      "Services",
                                      style: TextStyle(
                                        color: Color(0xFFd5d5d5),
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Text(
                                      "Location",
                                      style: TextStyle(
                                        color: Color(0xFFd5d5d5),
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Text(
                                      "Price",
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
                                  SizedBox(height: 12,),
                                  Text(
                                    "Overall rating",
                                    style: TextStyle(
                                      color: Color(0xFFd5d5d5),
                                      fontWeight: FontWeight.w200,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(height: 16,),
                                  RatingContainerWidget(width: MediaQuery.of(context).size.width * 0.54,),
                                  SizedBox(height: 3,),
                                  RatingContainerWidget(width: MediaQuery.of(context).size.width * 0.50,),
                                  SizedBox(height: 3,),
                                  RatingContainerWidget(width: MediaQuery.of(context).size.width * 0.44,),
                                  SizedBox(height: 3,),
                                  RatingContainerWidget(width: MediaQuery.of(context).size.width * 0.34,),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        HeaderWidget(text:"Photo" ,),
                        buildHorizontalHotelImagesList(),
                        HeaderWidget(text:"Reviews" ,),
                        buildHotelReviewList(),
                        MainButton(text: "Book now",)
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
  }
}


