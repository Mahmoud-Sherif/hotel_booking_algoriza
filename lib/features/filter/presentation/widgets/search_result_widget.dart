import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotel_booking_algoriza/core/utils/color_manager.dart';
import 'package:hotel_booking_algoriza/core/utils/media_query_values.dart';
import 'package:hotel_booking_algoriza/features/filter/data/models/search_hotels_model.dart';
import '../../../../config/locale/app_localizations.dart';

class SearchResultWidget extends StatelessWidget {
  final SearchHotelsModel? item;
  final int index;
  const SearchResultWidget({
    Key? key,
    this.item,
    this.index = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          // const SizedBox(height: 8),
          Container(
            // width: context.width / 1.1,
            height: context.height / 2.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(0.1),
              //     spreadRadius: 1,
              //     blurRadius: 4,
              //     offset: const Offset(0, 4),
              //   ),
              // ],
              color: ColorManager.secondry,
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
                      image: item!
                              .hotelModel.search[index].hotelImages.isNotEmpty
                          ? NetworkImage(
                              'http://api.mahmoudtaha.com/images/${item!.hotelModel.search[index].hotelImages[0].image}')
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
                      padding: const EdgeInsets.only(right: 8, top: 8),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: ColorManager.secondry,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_outline,
                            color: ColorManager.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Text(
                        //         maxLines: 2,
                        //         item!.hotelModel.search[index].name,
                        //         style: Theme.of(context)
                        //             .textTheme
                        //             .displayMedium!
                        //             .copyWith(fontSize: 18,),
                        //       ),
                        Flexible(
                            child: RichText(
                          overflow: TextOverflow.ellipsis,
                          strutStyle: StrutStyle(fontSize: 12.0),
                          text: TextSpan(
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontSize: 19,
                                ),
                            text: item!.hotelModel.search[index].name,
                          ),
                        )),
                        Text(
                          '\$ ${item!.hotelModel.search[index].price}',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                overflow: TextOverflow.ellipsis,
                                strutStyle: StrutStyle(fontSize: 12.0),
                                text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.w600),
                                  text: item!.hotelModel.search[index].address,
                                ),
                              )),
                              const SizedBox(width: 5),
                              const Icon(
                                Icons.location_on_rounded,
                                size: 14,
                                color: Color(0xff4fbe9e),
                              ),
                              Flexible(
                                  child: RichText(
                                overflow: TextOverflow.ellipsis,
                                strutStyle: StrutStyle(fontSize: 12.0),
                                text: TextSpan(
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600),
                                    text:
                                        '2.0 ${AppLocalizations.of(context)!.translate('km_to_city')!}'),
                              )),
                              //  Text(
                              //   '2.0 ${AppLocalizations.of(context)!.translate('km_to_city')!}',
                              //   style: TextStyle(
                              //     fontSize: 12,
                              //     color: Colors.grey,
                              //   ),
                              // ),
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
                ),
                // Row(
                //   children: [
                //     const Icon(
                //       Icons.location_on_rounded,
                //       size: 16,
                //       color: Color(0xff4fbe9e),
                //     ),
                //     Text(
                //       '2.0 ${AppLocalizations.of(context)!.translate('km_to_city')!}',
                //       style: TextStyle(
                //         fontSize: 12,
                //         color: Colors.grey,
                //       ),
                //     ),
                //   ],
                // ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      RatingBar.builder(
                        minRating: 1,
                        maxRating: 5,
                        initialRating:
                            double.parse(item!.hotelModel.search[index].rate),
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
                      Text(
                        '80 ${AppLocalizations.of(context)!.translate('reviews')!} ',
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 13,
                            //color: Color(0xFF6b6b6b),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
